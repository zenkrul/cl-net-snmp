;;;; -*- Mode: Lisp -*-
;;;; $Id$

(in-package :cl-user)

(unless (find-package ':snmp-system)
  (make-package ':snmp-system
                :use '(:common-lisp :asdf)))

(in-package :snmp-system)

(defsystem snmp
  :description "Simple Network Management Protocol"
  :author "Chun Tian (binghe) <binghe.lisp@gmail.com>"
  :version "6.0"
  :licence "MIT"
  :depends-on (:ironclad :usocket :asn.1)
  :components ((:module "vendor"
                :components ((:file "portable-threads")))
               (:file "package"     :depends-on ("vendor"))
	       (:file "constants"   :depends-on ("package"))
               (:file "condition"   :depends-on ("constants"))
	       (:file "pdu"         :depends-on ("package" "constants"))
               (:file "keytool"     :depends-on ("package"))
               (:file "snmp-smi"    :depends-on ("constants"))
	       (:file "session"     :depends-on ("keytool"))
               (:file "message"     :depends-on ("constants" "pdu" "session"))
               (:file "network"     :depends-on ("message" "session"))
               (:file "report"      :depends-on ("network" "message"))
               (:file "request"     :depends-on ("report" "pdu"))
               (:file "snmp-get"    :depends-on ("request"))
               (:file "snmp-walk"   :depends-on ("request" "snmp-smi"))
               (:file "snmp-trap"   :depends-on ("request"))
               ;; high-level client features
               (:module "client"
		:components ((:file "table")
                             (:file "discover")))))

(defmethod perform ((op test-op) (c (eql (find-system :snmp))))
  (oos 'load-op :snmp-test)
  (oos 'test-op :snmp-test))
