;;;; -*- Mode: Lisp -*-
;;;; $Id$

(in-package :cl-user)

(defpackage snmp-system
  (:use :common-lisp :asdf))

(in-package :snmp-system)

(defparameter *mib.lisp-expr*
  (with-open-file
      (s (merge-pathnames (make-pathname :name "mib"
                                         :type "lisp-expr")
                          *load-truename*)
         :direction :input)
    (read s)))

(defsystem snmp-base
  :description "SNMP Base"
  :version "5.12"
  :author "Chun Tian (binghe) <binghe.lisp@gmail.com>"
  :depends-on (:asn.1
	       :ironclad
               :usocket-udp)
  :components ((:file "package"     :depends-on ("vendor"))
	       (:file "constants"   :depends-on ("package"))
               (:file "condition"   :depends-on ("constants"))
	       (:file "pdu"         :depends-on ("package"))
               (:file "keytool"     :depends-on ("package"))
               (:file "snmp-smi"    :depends-on ("package"))
	       (:file "session"     :depends-on ("keytool"))
               (:file "message"     :depends-on ("constants" "pdu" "session"))
               (:file "network"     :depends-on ("message" "session"))
               (:file "report"      :depends-on ("network" "message"))
               (:file "request"     :depends-on ("report" "pdu"))
               (:file "snmp-get"    :depends-on ("request"))
               (:file "snmp-walk"   :depends-on ("request" "snmp-smi"))
               (:file "snmp-trap"   :depends-on ("report" "mib"))
               (:file "worker"      :depends-on ("session"))
	       #+lispworks
               (:file "update-mib"  :depends-on ("mib"))
               (:file "mib-depend"  :depends-on ("package"))
               (:module "mib"       :depends-on ("package")
                :components #.*mib.lisp-expr*)
               (:module "vendor"
                :components (#-portable-threads
                             (:file "portable-threads")))))