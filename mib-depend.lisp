;;;; -*- Mode: Lisp -*-
;;;; Auto-generated by SNMP:UPDATE-MIB.LISP

(IN-PACKAGE :ASN.1)
(EVAL-WHEN (:LOAD-TOPLEVEL :EXECUTE)
  (MAPCAR #'(LAMBDA (ASN.1::X)
              (SETF (GETHASH (CAR ASN.1::X)
                             ASN.1::*MIB-MODULE-DEPENDENCY*)
                    (CDR ASN.1::X)))
          '((LISP-CL-HTTP-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-CLOZURE-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-SBCL-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-CMUCL-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-FRANZ-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-LISPWORKS-MIB |SNMPv2-SMI| LISP-MIB)
            (LISP-MIB |SNMPv2-SMI|)
            (TUNNEL-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             INET-ADDRESS-MIB
             IPV6-FLOW-LABEL-MIB
             IF-MIB
             |IANAifType-MIB|)
            (MTA-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB
             NETWORK-SERVICES-MIB)
            (NETWORK-SERVICES-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB)
            (IPV6-FLOW-LABEL-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (RFC1213-MIB RFC1155-SMI)
            (UCD-SNMP-MIB-OLD
             UCD-SNMP-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-SMI|)
            (UCD-IPFILTER-MIB |SNMPv2-SMI| UCD-SNMP-MIB)
            (UCD-SNMP-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (UCD-IPFWACC-MIB |SNMPv2-SMI| |SNMPv2-TC| UCD-SNMP-MIB)
            (UCD-DLMOD-MIB |SNMPv2-SMI| |SNMPv2-TC| UCD-SNMP-MIB)
            (UCD-DISKIO-MIB |SNMPv2-SMI| |SNMPv2-TC| UCD-SNMP-MIB)
            (UCD-DEMO-MIB |SNMPv2-SMI| UCD-SNMP-MIB)
            (TRANSPORT-ADDRESS-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (UDP-MIB |SNMPv2-SMI| |SNMPv2-CONF| INET-ADDRESS-MIB)
            (TCP-MIB |SNMPv2-SMI| |SNMPv2-CONF| INET-ADDRESS-MIB)
            (SOURCE-ROUTING-MIB RFC1155-SMI BRIDGE-MIB)
            (SMUX-MIB RFC1155-SMI)
            (RMON-MIB |SNMPv2-SMI| |SNMPv2-TC| |SNMPv2-CONF|)
            (|RIPv2-MIB|
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             RFC1213-MIB)
            (OSPF-TRAP-MIB |SNMPv2-SMI| |SNMPv2-CONF| OSPF-MIB)
            (OSPF-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             RFC1213-MIB)
            (NOTIFICATION-LOG-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB
             |SNMPv2-CONF|)
            (NET-SNMP-MONITOR-MIB
             NET-SNMP-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|)
            (NET-SNMP-SYSTEM-MIB
             NET-SNMP-MIB
             NET-SNMP-TC
             |SNMPv2-SMI|
             |SNMPv2-TC|)
            (NET-SNMP-VACM-MIB
             SNMP-FRAMEWORK-MIB
             NET-SNMP-MIB
             SNMP-VIEW-BASED-ACM-MIB
             |SNMPv2-SMI|
             |SNMPv2-CONF|
             |SNMPv2-TC|)
            (NET-SNMP-TC NET-SNMP-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (NET-SNMP-MIB |SNMPv2-SMI|)
            (NET-SNMP-EXTEND-MIB
             NET-SNMP-AGENT-MIB
             |SNMPv2-SMI|
             |SNMPv2-CONF|
             |SNMPv2-TC|)
            (NET-SNMP-EXAMPLES-MIB
             |SNMPv2-SMI|
             SNMP-FRAMEWORK-MIB
             NET-SNMP-MIB
             |SNMPv2-TC|
             INET-ADDRESS-MIB)
            (NET-SNMP-AGENT-MIB
             SNMP-FRAMEWORK-MIB
             NET-SNMP-MIB
             |SNMPv2-SMI|
             |SNMPv2-CONF|
             |SNMPv2-TC|)
            (LM-SENSORS-MIB |SNMPv2-SMI| |SNMPv2-TC| UCD-SNMP-MIB)
            (IPV6-UDP-MIB |SNMPv2-CONF| |SNMPv2-SMI| IPV6-TC)
            (IPV6-TCP-MIB |SNMPv2-CONF| |SNMPv2-SMI| IPV6-TC)
            (IPV6-TC |SNMPv2-SMI| |SNMPv2-TC|)
            (IPV6-MIB |SNMPv2-SMI| |SNMPv2-TC| |SNMPv2-CONF| IPV6-TC)
            (IPV6-ICMP-MIB |SNMPv2-SMI| |SNMPv2-CONF| IPV6-MIB)
            (IP-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             INET-ADDRESS-MIB
             IF-MIB)
            (IP-FORWARD-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             IF-MIB
             IP-MIB
             IANA-RTPROTO-MIB
             INET-ADDRESS-MIB)
            (INET-ADDRESS-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (IF-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             |SNMPv2-MIB|
             |IANAifType-MIB|)
            (IF-INVERTED-STACK-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             IF-MIB)
            (|IANAifType-MIB| |SNMPv2-SMI| |SNMPv2-TC|)
            (IANA-RTPROTO-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (IANA-LANGUAGE-MIB |SNMPv2-SMI|)
            (IANA-ADDRESS-FAMILY-NUMBERS-MIB |SNMPv2-SMI| |SNMPv2-TC|)
            (HOST-RESOURCES-TYPES |SNMPv2-SMI| HOST-RESOURCES-MIB)
            (HOST-RESOURCES-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             IF-MIB)
            (HCNUM-TC |SNMPv2-SMI| |SNMPv2-TC|)
            (GNOME-SMI |SNMPv2-SMI|)
            (|EtherLike-MIB|
             |SNMPv2-SMI|
             |SNMPv2-CONF|
             |SNMPv2-TC|
             IF-MIB)
            (DISMAN-NSLOOKUP-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB
             INET-ADDRESS-MIB)
            (DISMAN-TRACEROUTE-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB
             IF-MIB
             INET-ADDRESS-MIB
             DISMAN-PING-MIB)
            (DISMAN-EXPRESSION-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-MIB|
             SNMP-FRAMEWORK-MIB
             |SNMPv2-CONF|)
            (DISMAN-PING-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             IF-MIB
             SNMP-FRAMEWORK-MIB
             INET-ADDRESS-MIB)
            (DISMAN-SCRIPT-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB)
            (DISMAN-SCHEDULE-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB)
            (DISMAN-EVENT-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             |SNMPv2-MIB|
             SNMP-TARGET-MIB
             SNMP-FRAMEWORK-MIB)
            (BRIDGE-MIB RFC1155-SMI RFC1213-MIB RFC-1215)
            (BGP4-MIB |SNMPv2-SMI| |SNMPv2-CONF|)
            (AGENTX-MIB
             |SNMPv2-SMI|
             SNMP-FRAMEWORK-MIB
             |SNMPv2-CONF|
             |SNMPv2-TC|)
            (|SNMPv2-TM| |SNMPv2-SMI| |SNMPv2-TC|)
            (|SNMPv2-TC| |SNMPv2-SMI|)
            (|SNMPv2-MIB| |SNMPv2-SMI| |SNMPv2-TC| |SNMPv2-CONF|)
            (|SNMPv2-CONF| |SNMPv2-SMI|)
            (SNMP-VIEW-BASED-ACM-MIB
             |SNMPv2-CONF|
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB)
            (SNMP-USM-DH-OBJECTS-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-USER-BASED-SM-MIB
             SNMP-FRAMEWORK-MIB)
            (SNMP-USM-AES-MIB |SNMPv2-SMI| SNMP-FRAMEWORK-MIB)
            (SNMP-USER-BASED-SM-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             |SNMPv2-CONF|
             SNMP-FRAMEWORK-MIB)
            (SNMP-TARGET-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB
             |SNMPv2-CONF|)
            (SNMP-PROXY-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB
             SNMP-TARGET-MIB
             |SNMPv2-CONF|)
            (SNMP-NOTIFICATION-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB
             SNMP-TARGET-MIB
             |SNMPv2-CONF|)
            (SNMP-MPD-MIB |SNMPv2-CONF| |SNMPv2-SMI|)
            (SNMP-FRAMEWORK-MIB |SNMPv2-SMI| |SNMPv2-TC| |SNMPv2-CONF|)
            (SNMP-COMMUNITY-MIB
             |SNMPv2-SMI|
             |SNMPv2-TC|
             SNMP-FRAMEWORK-MIB
             SNMP-TARGET-MIB
             |SNMPv2-CONF|))))
