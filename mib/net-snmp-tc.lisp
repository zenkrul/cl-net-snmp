;;;; -*- Mode: Lisp -*-
;;;; Auto-generated from ASN-SNMP:NET-SNMP-TC

(in-package :asn.1)
(setf *current-module* 'net-snmp-tc)
(defoid |netSnmpTCs| (|netSnmpModuleIDs| 1)
  (:type 'module-identity)
  (:description
   "Textual conventions and enumerations for the Net-SNMP project"))
(deftype |Float| () 't)
(defoid |hpux9| (|netSnmpAgentOIDs| 1) (:type 'object-identity))
(defoid |sunos4| (|netSnmpAgentOIDs| 2) (:type 'object-identity))
(defoid |solaris| (|netSnmpAgentOIDs| 3) (:type 'object-identity))
(defoid |osf| (|netSnmpAgentOIDs| 4) (:type 'object-identity))
(defoid |ultrix| (|netSnmpAgentOIDs| 5) (:type 'object-identity))
(defoid |hpux10| (|netSnmpAgentOIDs| 6) (:type 'object-identity))
(defoid |netbsd| (|netSnmpAgentOIDs| 7) (:type 'object-identity))
(defoid |freebsd| (|netSnmpAgentOIDs| 8) (:type 'object-identity))
(defoid |irix| (|netSnmpAgentOIDs| 9) (:type 'object-identity))
(defoid |linux| (|netSnmpAgentOIDs| 10) (:type 'object-identity))
(defoid |bsdi| (|netSnmpAgentOIDs| 11) (:type 'object-identity))
(defoid |openbsd| (|netSnmpAgentOIDs| 12) (:type 'object-identity))
(defoid |win32| (|netSnmpAgentOIDs| 13) (:type 'object-identity))
(defoid |hpux11| (|netSnmpAgentOIDs| 14) (:type 'object-identity))
(defoid |aix| (|netSnmpAgentOIDs| 15) (:type 'object-identity))
(defoid |macosx| (|netSnmpAgentOIDs| 16) (:type 'object-identity))
(defoid |unknown| (|netSnmpAgentOIDs| 255) (:type 'object-identity))
(defoid |netSnmpTCPDomain| (|netSnmpDomains| 1)
  (:type 'object-identity))
(defoid |netSnmpUnixDomain| (|netSnmpDomains| 2)
  (:type 'object-identity))
(defoid |netSnmpAAL5PVCDomain| (|netSnmpDomains| 3)
  (:type 'object-identity))
(defoid |netSnmpUDPIPv6Domain| (|netSnmpDomains| 4)
  (:type 'object-identity))
(defoid |netSnmpTCPIPv6Domain| (|netSnmpDomains| 5)
  (:type 'object-identity))
(defoid |netSnmpCallbackDomain| (|netSnmpDomains| 6)
  (:type 'object-identity))
