;;;; Auto-generated from MIB:SNMP-PROXY-MIB

(IN-PACKAGE :ASN.1)
(SETF *CURRENT-MODULE* 'SNMP-PROXY-MIB)
(DEFOID |snmpProxyMIB| (|snmpModules| 14))
(DEFOID |snmpProxyObjects| (|snmpProxyMIB| 1))
(DEFOID |snmpProxyConformance| (|snmpProxyMIB| 3))
(DEFOID |snmpProxyTable| (|snmpProxyObjects| 2))
(DEFOID |snmpProxyEntry| (|snmpProxyTable| 1))
(DEFUNKNOWN :TYPE-ASSIGNMENT)
(DEFOID |snmpProxyName| (|snmpProxyEntry| 1))
(DEFOID |snmpProxyType| (|snmpProxyEntry| 2))
(DEFOID |snmpProxyContextEngineID| (|snmpProxyEntry| 3))
(DEFOID |snmpProxyContextName| (|snmpProxyEntry| 4))
(DEFOID |snmpProxyTargetParamsIn| (|snmpProxyEntry| 5))
(DEFOID |snmpProxySingleTargetOut| (|snmpProxyEntry| 6))
(DEFOID |snmpProxyMultipleTargetOut| (|snmpProxyEntry| 7))
(DEFOID |snmpProxyStorageType| (|snmpProxyEntry| 8))
(DEFOID |snmpProxyRowStatus| (|snmpProxyEntry| 9))
(DEFOID |snmpProxyCompliances| (|snmpProxyConformance| 1))
(DEFOID |snmpProxyGroups| (|snmpProxyConformance| 2))
(DEFUNKNOWN 'MODULE-COMPLIANCE)
(DEFOID |snmpProxyGroup| (|snmpProxyGroups| 3))
