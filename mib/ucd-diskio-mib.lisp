;;;; Auto-generated from ASN-SNMP:UCD-DISKIO-MIB

(IN-PACKAGE :ASN.1)
(SETF *CURRENT-MODULE* 'UCD-DISKIO-MIB)
(DEFOID |ucdDiskIOMIB| (|ucdExperimental| 15))
(DEFOID |diskIOTable| (|ucdDiskIOMIB| 1))
(DEFOID |diskIOEntry| (|diskIOTable| 1))
(DEFUNKNOWN :TYPE-ASSIGNMENT)
(DEFOID |diskIOIndex| (|diskIOEntry| 1))
(DEFOID |diskIODevice| (|diskIOEntry| 2))
(DEFOID |diskIONRead| (|diskIOEntry| 3))
(DEFOID |diskIONWritten| (|diskIOEntry| 4))
(DEFOID |diskIOReads| (|diskIOEntry| 5))
(DEFOID |diskIOWrites| (|diskIOEntry| 6))
(DEFOID |diskIOLA1| (|diskIOEntry| 9))
(DEFOID |diskIOLA5| (|diskIOEntry| 10))
(DEFOID |diskIOLA15| (|diskIOEntry| 11))
(DEFOID |diskIONReadX| (|diskIOEntry| 12))
(DEFOID |diskIONWrittenX| (|diskIOEntry| 13))