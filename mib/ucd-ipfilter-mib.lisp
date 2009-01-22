;;;; -*- Mode: Lisp -*-
;;;; Auto-generated from MIB:NET-SNMP;UCD-IPFILTER-MIB.TXT by ASN.1 5.0

(in-package :asn.1)

(eval-when (:load-toplevel :execute)
  (setf *current-module* 'ucd-ipfilter-mib))

(defpackage :asn.1/ucd-ipfilter-mib
  (:nicknames :ucd-ipfilter-mib)
  (:use :closer-common-lisp :asn.1)
  (:import-from :|ASN.1/SNMPv2-SMI| object-type module-identity
                |Counter32| |Integer32|)
  (:import-from :asn.1/ucd-snmp-mib |ucdExperimental|))

(in-package :ucd-ipfilter-mib)

(defoid |ucdIpFilter| (|ucdExperimental| 2)
  (:type 'module-identity)
  (:description
   "This module defines MIB components for reading information 
	 from the IP Filter. This would let you only read its rules 
	 and counters.

         IP Filter by Darren Reed <darrenr@pobox.com>
         IP Filter web page URL http://coombs.anu.edu.au/~avalon/
         ipf-mod.pl module by Yaroslav Terletsky <ts@polynet.lviv.ua>
         IP Filter UCD-SNMP module URL
         ftp://ftp.polynet.lviv.ua/pub/UNIX/security/ipf/ucd-snmp-ipf-mod.tgz
         Yaroslav Terletsky <ts@polynet.lviv.ua>"))

(defoid |ipfInTable| (|ucdIpFilter| 1)
  (:type 'object-type)
  (:syntax '(vector |IpfInEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "A table with IP Filter incoming rules and statistics."))

(defoid |ipfInEntry| (|ipfInTable| 1)
  (:type 'object-type)
  (:syntax '|IpfInEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "IP Filter incoming rules table entry."))

(defclass |IpfInEntry| (sequence-type)
  ((|ipfInIndex| :type |Integer32|)
   (|ipfInRule| :type t)
   (|ipfInHits| :type |Counter32|)))

(defoid |ipfInIndex| (|ipfInEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Reference index for each incoming IP Filter rule."))

(defoid |ipfInRule| (|ipfInEntry| 2)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Textual representation of the incoming IP Filter rule."))

(defoid |ipfInHits| (|ipfInEntry| 3)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Hits of the incoming IP Filter rule."))

(defoid |ipfOutTable| (|ucdIpFilter| 2)
  (:type 'object-type)
  (:syntax '(vector |IpfOutEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "A table with IP Filter outgoing rules and statistic."))

(defoid |ipfOutEntry| (|ipfOutTable| 1)
  (:type 'object-type)
  (:syntax '|IpfOutEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "IP Filter outgoing rules table entry."))

(defclass |IpfOutEntry| (sequence-type)
  ((|ipfOutIndex| :type |Integer32|)
   (|ipfOutRule| :type t)
   (|ipfOutHits| :type |Counter32|)))

(defoid |ipfOutIndex| (|ipfOutEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Reference index for each outgoing IP Filter rule."))

(defoid |ipfOutRule| (|ipfOutEntry| 2)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Textual representation of the outgoing IP Filter rule."))

(defoid |ipfOutHits| (|ipfOutEntry| 3)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Hits of the outgoing IP Filter rule."))

(defoid |ipfAccInTable| (|ucdIpFilter| 3)
  (:type 'object-type)
  (:syntax '(vector |IpfAccInEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "A table with IP Filter incoming accounting rules
	 and statistics."))

(defoid |ipfAccInEntry| (|ipfAccInTable| 1)
  (:type 'object-type)
  (:syntax '|IpfAccInEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "IP FIlter incoming accounting rules table entry."))

(defclass |IpfAccInEntry| (sequence-type)
  ((|ipfAccInIndex| :type |Integer32|)
   (|ipfAccInRule| :type t)
   (|ipfAccInHits| :type |Counter32|)
   (|ipfAccInBytes| :type |Counter32|)))

(defoid |ipfAccInIndex| (|ipfAccInEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Reference index for each incoming accounting
	 IP Filter rule."))

(defoid |ipfAccInRule| (|ipfAccInEntry| 2)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Textual representation of the incoming accounting
	 IP Filter rule."))

(defoid |ipfAccInHits| (|ipfAccInEntry| 3)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Hits of the incoming accounting IP Filter rule."))

(defoid |ipfAccInBytes| (|ipfAccInEntry| 4)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Bytes passed thru the incoming accounting
	 IP Filter rule."))

(defoid |ipfAccOutTable| (|ucdIpFilter| 4)
  (:type 'object-type)
  (:syntax '(vector |IpfAccOutEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "A table with IP Filter outgoing accounting rules
	 and statistic."))

(defoid |ipfAccOutEntry| (|ipfAccOutTable| 1)
  (:type 'object-type)
  (:syntax '|IpfAccOutEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "IP Filter outgoing accounting rules table entry."))

(defclass |IpfAccOutEntry| (sequence-type)
  ((|ipfAccOutIndex| :type |Integer32|)
   (|ipfAccOutRule| :type t)
   (|ipfAccOutHits| :type |Counter32|)
   (|ipfAccOutBytes| :type |Counter32|)))

(defoid |ipfAccOutIndex| (|ipfAccOutEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Reference index for each outgoing accounting
	 IP Filter rule."))

(defoid |ipfAccOutRule| (|ipfAccOutEntry| 2)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Textual representation of the outgoing accounting
	 IP Filter rule."))

(defoid |ipfAccOutHits| (|ipfAccOutEntry| 3)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "Hits of the outgoing accounting IP Filter rule."))

(defoid |ipfAccOutBytes| (|ipfAccOutEntry| 4)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "Bytes passed thru the outgoing accounting
	 IP Filter rule."))

(eval-when (:load-toplevel :execute)
  (pushnew 'ucd-ipfilter-mib *mib-modules*)
  (setf *current-module* nil))

