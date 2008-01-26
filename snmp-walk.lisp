(in-package :snmp)

(defgeneric snmp-walk (object var)
  (:documentation "SNMP Walk"))

(defmethod snmp-walk ((host string) var)
  (let ((session (open-session host)))
    (unwind-protect
        (snmp-walk session var)
      (close-session session))))

(defmethod snmp-walk ((session v1-session) (var object-id))
  "SNMP Walk for v1 and v2c"
  (let ((message (make-instance 'v1-message
                                :version (version-of session)
                                :community (community-of session)
                                :pdu (make-instance 'get-next-request-pdu
                                                    :variable-bindings (list nil)))))
    (labels ((iter (v acc)
               (setf (car (variable-bindings-of (msg-pdu-of message))) (list v nil)
                     (request-id-of (msg-pdu-of message)) (generate-request-id
                                                           (msg-pdu-of message)))
               (let ((data (ber-encode message))
                     (socket (socket-of session)))
                 (write-sequence data socket)
                 (force-output socket)
                 (let ((result (decode-message socket 1)))
                   (let ((vb (car (variable-bindings-of (msg-pdu-of result)))))
                     (if (not (oid-< (car vb) var))
                       (nreverse acc)
                       (iter (first vb) (cons vb acc))))))))
      (iter var nil))))

(defmethod snmp-walk ((session v1-session) (var list))
  (let ((oid (*->oid var)))
    (snmp-walk session oid)))