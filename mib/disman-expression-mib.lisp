;;;; -*- Mode: Lisp -*-
;;;; Auto-generated from MIB:NET-SNMP;DISMAN-EXPRESSION-MIB.TXT by ASN.1 5.0

(in-package :asn.1)

(eval-when (:load-toplevel :execute)
  (setf *current-module* 'disman-expression-mib))

(defpackage :asn.1/disman-expression-mib
  (:nicknames :disman-expression-mib)
  (:use :closer-common-lisp :asn.1)
  (:import-from :|ASN.1/SNMPv2-SMI| module-identity object-type
                |Integer32| |Gauge32| |Unsigned32| |Counter32|
                |Counter64| |IpAddress| |TimeTicks| |mib-2|
                |zeroDotZero|)
  (:import-from :|ASN.1/SNMPv2-TC| |RowStatus| |TruthValue|
                |TimeStamp|)
  (:import-from :|ASN.1/SNMPv2-MIB| |sysUpTime|)
  (:import-from :asn.1/snmp-framework-mib |SnmpAdminString|)
  (:import-from :|ASN.1/SNMPv2-CONF| module-compliance object-group))

(in-package :disman-expression-mib)

(defoid |dismanExpressionMIB| (|mib-2| 90)
  (:type 'module-identity)
  (:description
   "The MIB module for defining expressions of MIB objects for
     management purposes."))

(defoid |dismanExpressionMIBObjects| (|dismanExpressionMIB| 1)
  (:type 'object-identity))

(defoid |expResource| (|dismanExpressionMIBObjects| 1)
  (:type 'object-identity))

(defoid |expDefine| (|dismanExpressionMIBObjects| 2)
  (:type 'object-identity))

(defoid |expValue| (|dismanExpressionMIBObjects| 3)
  (:type 'object-identity))

(defoid |expResourceDeltaMinimum| (|expResource| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-write|)
  (:status '|current|)
  (:description
   "The minimum expExpressionDeltaInterval this system will
     accept.  A system may use the larger values of this minimum to
     lessen the impact of constantly computing deltas.  For larger
     delta sampling intervals the system samples less often and
     suffers less overhead.  This object provides a way to enforce
     such lower overhead for all expressions created after it is
     set.

     The value -1 indicates that expResourceDeltaMinimum is
     irrelevant as the system will not accept 'deltaValue' as a
     value for expObjectSampleType.

     Unless explicitly resource limited, a system's value for
     this object should be 1, allowing as small as a 1 second
     interval for ongoing delta sampling.

     Changing this value will not invalidate an existing setting
     of expObjectSampleType."))

(defoid |expResourceDeltaWildcardInstanceMaximum| (|expResource| 2)
  (:type 'object-type)
  (:syntax '|Unsigned32|)
  (:max-access '|read-write|)
  (:status '|current|)
  (:description
   "For every instance of a deltaValue object, one dynamic instance
     entry is needed for holding the instance value from the previous
     sample, i.e. to maintain state.

     This object limits maximum number of dynamic instance entries
     this system will support for wildcarded delta objects in
     expressions. For a given delta expression, the number of
     dynamic instances is the number of values that meet all criteria
     to exist times the number of delta values in the expression.

     A value of 0 indicates no preset limit, that is, the limit
     is dynamic based on system operation and resources.

     Unless explicitly resource limited, a system's value for
     this object should be 0.


     Changing this value will not eliminate or inhibit existing delta
     wildcard instance objects but will prevent the creation of more
     such objects.

     An attempt to allocate beyond the limit results in expErrorCode
     being tooManyWildcardValues for that evaluation attempt."))

(defoid |expResourceDeltaWildcardInstances| (|expResource| 3)
  (:type 'object-type)
  (:syntax '|Gauge32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The number of currently active instance entries as
     defined for expResourceDeltaWildcardInstanceMaximum."))

(defoid |expResourceDeltaWildcardInstancesHigh| (|expResource| 4)
  (:type 'object-type)
  (:syntax '|Gauge32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The highest value of expResourceDeltaWildcardInstances
     that has occurred since initialization of the managed
     system."))

(defoid |expResourceDeltaWildcardInstanceResourceLacks|
        (|expResource| 5)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The number of times this system could not evaluate an
     expression because that would have created a value instance in
     excess of expResourceDeltaWildcardInstanceMaximum."))

(defoid |expExpressionTable| (|expDefine| 1)
  (:type 'object-type)
  (:syntax '(vector |ExpExpressionEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "A table of expression definitions."))

(defoid |expExpressionEntry| (|expExpressionTable| 1)
  (:type 'object-type)
  (:syntax '|ExpExpressionEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "Information about a single expression.  New expressions
     can be created using expExpressionRowStatus.

     To create an expression first create the named entry in this
     table.  Then use expExpressionName to populate expObjectTable.
     For expression evaluation to succeed all related entries in
     expExpressionTable and expObjectTable must be 'active'.  If
     these conditions are not met the corresponding values in
     expValue simply are not instantiated.

     Deleting an entry deletes all related entries in expObjectTable
     and expErrorTable.

     Because of the relationships among the multiple tables for an
     expression (expExpressionTable, expObjectTable, and
     expValueTable) and the SNMP rules for independence in setting
     object values, it is necessary to do final error checking when
     an expression is evaluated, that is, when one of its instances
     in expValueTable is read or a delta interval expires.  Earlier
     checking need not be done and an implementation may not impose
     any ordering on the creation of objects related to an
     expression.

     To maintain security of MIB information, when creating a new row in
     this table, the managed system must record the security credentials
     of the requester.  These security credentials are the parameters
     necessary as inputs to isAccessAllowed from the Architecture for

     Describing SNMP Management Frameworks.  When obtaining the objects
     that make up the expression, the system must (conceptually) use
     isAccessAllowed to ensure that it does not violate security.

     The evaluation of the expression takes place under the
     security credentials of the creator of its expExpressionEntry.

     Values of read-write objects in this table may be changed

     at any time."))

(defclass |ExpExpressionEntry| (sequence-type)
  ((|expExpressionOwner| :type |SnmpAdminString|)
   (|expExpressionName| :type |SnmpAdminString|)
   (|expExpression| :type t)
   (|expExpressionValueType| :type integer)
   (|expExpressionComment| :type |SnmpAdminString|)
   (|expExpressionDeltaInterval| :type |Integer32|)
   (|expExpressionPrefix| :type object-id)
   (|expExpressionErrors| :type |Counter32|)
   (|expExpressionEntryStatus| :type |RowStatus|)))

(defoid |expExpressionOwner| (|expExpressionEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "The owner of this entry. The exact semantics of this
     string are subject to the security policy defined by the
     security administrator."))

(defoid |expExpressionName| (|expExpressionEntry| 2)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "The name of the expression.  This is locally unique, within
     the scope of an expExpressionOwner."))

(defoid |expExpression| (|expExpressionEntry| 3)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The expression to be evaluated.  This object is the same
     as a DisplayString (RFC 1903) except for its maximum length.

     Except for the variable names the expression is in ANSI C
     syntax.  Only the subset of ANSI C operators and functions
     listed here is allowed.

     Variables are expressed as a dollar sign ('$') and an

     integer that corresponds to an expObjectIndex.  An
     example of a valid expression is:

          ($1-$5)*100

     Expressions must not be recursive, that is although an expression
     may use the results of another expression, it must not contain
     any variable that is directly or indirectly a result of its own
     evaluation. The managed system must check for recursive
     expressions.

     The only allowed operators are:

          ( )
          - (unary)
          + - * / %
          & | ^ << >> ~
          ! && || == != > >= < <=

     Note the parentheses are included for parenthesizing the
     expression, not for casting data types.

     The only constant types defined are:

          int (32-bit signed)
          long (64-bit signed)
          unsigned int
          unsigned long
          hexadecimal
          character
          string
          oid

     The default type for a positive integer is int unless it is too
     large in which case it is long.

     All but oid are as defined for ANSI C.  Note that a
     hexadecimal constant may end up as a scalar or an array of
     8-bit integers.  A string constant is enclosed in double
     quotes and may contain back-slashed individual characters
     as in ANSI C.

     An oid constant comprises 32-bit, unsigned integers and at
     least one period, for example:

          0.
          .0
          1.3.6.1

     No additional leading or trailing subidentifiers are automatically
     added to an OID constant.  The constant is taken as expressed.

     Integer-typed objects are treated as 32- or 64-bit, signed
     or unsigned integers, as appropriate.  The results of
     mixing them are as for ANSI C, including the type of the
     result.  Note that a 32-bit value is thus promoted to 64 bits
     only in an operation with a 64-bit value.  There is no
     provision for larger values to handle overflow.

     Relative to SNMP data types, a resulting value becomes
     unsigned when calculating it uses any unsigned value,
     including a counter.  To force the final value to be of
     data type counter the expression must explicitly use the
     counter32() or counter64() function (defined below).

     OCTET STRINGS and OBJECT IDENTIFIERs are treated as
     one-dimensioned arrays of unsigned 8-bit integers and
     unsigned 32-bit integers, respectively.

     IpAddresses are treated as 32-bit, unsigned integers in
     network byte order, that is, the hex version of 255.0.0.0 is
     0xff000000.

     Conditional expressions result in a 32-bit, unsigned integer
     of value 0 for false or 1 for true. When an arbitrary value
     is used as a boolean 0 is false and non-zero is true.

     Rules for the resulting data type from an operation, based on
     the operator:

     For << and >> the result is the same as the left hand operand.

     For &&, ||, ==, !=, <, <=, >, and >= the result is always
     Unsigned32.

     For unary - the result is always Integer32.

     For +, -, *, /, %, &, |, and ^ the result is promoted according
     to the following rules, in order from most to least preferred:

          If left hand and right hand operands are the same type,
          use that.

          If either side is Counter64, use that.

          If either side is IpAddress, use that.


          If either side is TimeTicks, use that.

          If either side is Counter32, use that.

          Otherwise use Unsigned32.

     The following rules say what operators apply with what data
     types.  Any combination not explicitly defined does not work.

     For all operators any of the following can be the left hand or
     right hand operand: Integer32, Counter32, Unsigned32, Counter64.

     The operators +, -, *, /, %, <, <=, >, and >= work with
     TimeTicks.

     The operators &, |, and ^ work with IpAddress.

     The operators << and >> work with IpAddress but only as the
     left hand operand.

     The + operator performs a concatenation of two OCTET STRINGs or
     two OBJECT IDENTIFIERs.

     The operators &, | perform bitwise operations on OCTET STRINGs.
     If the OCTET STRING happens to be a DisplayString the results
     may be meaningless, but the agent system does not check this as
     some such systems do not have this information.

     The operators << and >> perform bitwise operations on OCTET
     STRINGs appearing as the left hand operand.

     The only functions defined are:

          counter32
          counter64
          arraySection
          stringBegins
          stringEnds
          stringContains
          oidBegins
          oidEnds
          oidContains
          average
          maximum
          minimum
          sum
          exists


     The following function definitions indicate their parameters by
     naming the data type of the parameter in the parameter's position
     in the parameter list.  The parameter must be of the type indicated
     and generally may be a constant, a MIB object, a function, or an
     expression.

     counter32(integer) - wrapped around an integer value counter32
     forces Counter32 as a data type.

     counter64(integer) - similar to counter32 except that the
     resulting data type is 'counter64'.

     arraySection(array, integer, integer) - selects a piece of an
     array (i.e. part of an OCTET STRING or OBJECT IDENTIFIER).  The
     integer arguments are in the range 0 to 4,294,967,295.  The
     first is an initial array index (one-dimensioned) and the second
     is an ending array index.  A value of 0 indicates first or last
     element, respectively.  If the first element is larger than the
     array length the result is 0 length.  If the second integer is
     less than or equal to the first, the result is 0 length.  If the
     second is larger than the array length it indicates last
     element.

     stringBegins/Ends/Contains(octetString, octetString) - looks for
     the second string (which can be a string constant) in the first
     and returns the one-dimensioned arrayindex where the match began.
     A return value of 0 indicates no match (i.e. boolean false).

     oidBegins/Ends/Contains(oid, oid) - looks for the second OID
     (which can be an OID constant) in the first and returns the
     the one-dimensioned index where the match began. A return value
     of 0 indicates no match (i.e. boolean false).

     average/maximum/minimum(integer) - calculates the average,
     minimum, or maximum value of the integer valued object over
     multiple sample times.  If the object disappears for any
     sample period, the accumulation and the resulting value object
     cease to exist until the object reappears at which point the
     calculation starts over.

     sum(integerObject*) - sums all available values of the
     wildcarded integer object, resulting in an integer scalar.  Must
     be used with caution as it wraps on overflow with no
     notification.

     exists(anyTypeObject) - verifies the object instance exists. A
     return value of 0 indicates NoSuchInstance (i.e. boolean
     false)."))

(defoid |expExpressionValueType| (|expExpressionEntry| 4)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The type of the expression value.  One and only one of the
     value objects in expValueTable will be instantiated to match
     this type.

     If the result of the expression can not be made into this type,
     an invalidOperandType error will occur."))

(defoid |expExpressionComment| (|expExpressionEntry| 5)
  (:type 'object-type)
  (:syntax '|SnmpAdminString|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "A comment to explain the use or meaning of the expression."))

(defoid |expExpressionDeltaInterval| (|expExpressionEntry| 6)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "Sampling interval for objects in this expression with
     expObjectSampleType 'deltaValue'.

     This object has no effect if the the expression has no
     deltaValue objects.

     A value of 0 indicates no automated sampling.  In this case
     the delta is the difference from the last time the expression
     was evaluated.  Note that this is subject to unpredictable
     delta times in the face of retries or multiple managers.

     A value greater than zero is the number of seconds between
     automated samples.

     Until the delta interval has expired once the delta for the

     object is effectively not instantiated and evaluating
     the expression has results as if the object itself were not
     instantiated.

     Note that delta values potentially consume large amounts of
     system CPU and memory.  Delta state and processing must
     continue constantly even if the expression is not being used.
     That is, the expression is being evaluated every delta interval,
     even if no application is reading those values.  For wildcarded
     objects this can be substantial overhead.

     Note that delta intervals, external expression value sampling
     intervals and delta intervals for expressions within other
     expressions can have unusual interactions as they are impossible
     to synchronize accurately.  In general one interval embedded
     below another must be enough shorter that the higher sample
     sees relatively smooth, predictable behavior.  So, for example,
     to avoid the higher level getting the same sample twice, the
     lower level should sample at least twice as fast as the higher
     level does."))

(defoid |expExpressionPrefix| (|expExpressionEntry| 7)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "An object prefix to assist an application in determining
     the instance indexing to use in expValueTable, relieving the
     application of the need to scan the expObjectTable to
     determine such a prefix.

     See expObjectTable for information on wildcarded objects.

     If the expValueInstance portion of the value OID may
     be treated as a scalar (that is, normally, 0) the value of
     expExpressionPrefix is zero length, that is, no OID at all.
     Note that zero length implies a null OID, not the OID 0.0.

     Otherwise, the value of expExpressionPrefix is the expObjectID
     value of any one of the wildcarded objects for the expression.
     This is sufficient, as the remainder, that is, the instance
     fragment relevant to instancing the values, must be the same for
     all wildcarded objects in the expression."))

(defoid |expExpressionErrors| (|expExpressionEntry| 8)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The number of errors encountered while evaluating this
     expression.

     Note that an object in the expression not being accessible,
     is not considered an error. An example of an inaccessible
     object is when the object is excluded from the view of the
     user whose security credentials are used in the expression
     evaluation. In such cases, it is a legitimate condition
     that causes the corresponding expression value not to be
     instantiated."))

(defoid |expExpressionEntryStatus| (|expExpressionEntry| 9)
  (:type 'object-type)
  (:syntax '|RowStatus|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The control that allows creation and deletion of entries."))

(defoid |expErrorTable| (|expDefine| 2)
  (:type 'object-type)
  (:syntax '(vector |ExpErrorEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "A table of expression errors."))

(defoid |expErrorEntry| (|expErrorTable| 1)
  (:type 'object-type)
  (:syntax '|ExpErrorEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "Information about errors in processing an expression.

     Entries appear in this table only when there is a matching
     expExpressionEntry and then only when there has been an
     error for that expression as reflected by the error codes
     defined for expErrorCode."))

(defclass |ExpErrorEntry| (sequence-type)
  ((|expErrorTime| :type |TimeStamp|)
   (|expErrorIndex| :type |Integer32|)
   (|expErrorCode| :type integer)
   (|expErrorInstance| :type object-id)))

(defoid |expErrorTime| (|expErrorEntry| 1)
  (:type 'object-type)
  (:syntax '|TimeStamp|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value of sysUpTime the last time an error caused a
     failure to evaluate this expression."))

(defoid |expErrorIndex| (|expErrorEntry| 2)
  (:type 'object-type)
  (:syntax '|Integer32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The one-dimensioned character array index into
     expExpression for where the error occurred.  The value
     zero indicates irrelevance."))

(defoid |expErrorCode| (|expErrorEntry| 3)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The error that occurred.  In the following explanations the
     expected timing of the error is in parentheses.  'S' means
     the error occurs on a Set request.  'E' means the error

     occurs on the attempt to evaluate the expression either due to
     Get from expValueTable or in ongoing delta processing.

     invalidSyntax       the value sent for expExpression is not
                    valid Expression MIB expression syntax
                    (S)
     undefinedObjectIndex     an object reference ($n) in
                    expExpression does not have a matching
                    instance in expObjectTable (E)
     unrecognizedOperator     the value sent for expExpression held an
                    unrecognized operator (S)
     unrecognizedFunction     the value sent for expExpression held an
                    unrecognized function name (S)
     invalidOperandType  an operand in expExpression is not the
                    right type for the associated operator
                    or result (SE)
     unmatchedParenthesis     the value sent for expExpression is not
                    correctly parenthesized (S)
     tooManyWildcardValues    evaluating the expression exceeded the
                    limit set by
                    expResourceDeltaWildcardInstanceMaximum
                    (E)
     recursion      through some chain of embedded
                    expressions the expression invokes itself
                    (E)
     deltaTooShort       the delta for the next evaluation passed
                    before the system could evaluate the
                    present sample (E)
     resourceUnavailable some resource, typically dynamic memory,
                    was unavailable (SE)
     divideByZero        an attempt to divide by zero occurred
                    (E)

     For the errors that occur when the attempt is made to set
     expExpression Set request fails with the SNMP error code
     'wrongValue'.  Such failures refer to the most recent failure to
     Set expExpression, not to the present value of expExpression
     which must be either unset or syntactically correct.

     Errors that occur during evaluation for a Get* operation return
     the SNMP error code 'genErr' except for 'tooManyWildcardValues'
     and 'resourceUnavailable' which return the SNMP error code
     'resourceUnavailable'."))

(defoid |expErrorInstance| (|expErrorEntry| 4)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The expValueInstance being evaluated when the error
     occurred.  A zero-length indicates irrelevance."))

(defoid |expObjectTable| (|expDefine| 3)
  (:type 'object-type)
  (:syntax '(vector |ExpObjectEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "A table of object definitions for each expExpression.

     Wildcarding instance IDs:

     It is legal to omit all or part of the instance portion for
     some or all of the objects in an expression. (See the
     DESCRIPTION of expObjectID for details.  However, note that
     if more than one object in the same expression is wildcarded
     in this way, they all must be objects where that portion of
     the instance is the same.  In other words, all objects may be
     in the same SEQUENCE or in different SEQUENCEs but with the
     same semantic index value (e.g., a value of ifIndex)
     for the wildcarded portion."))

(defoid |expObjectEntry| (|expObjectTable| 1)
  (:type 'object-type)
  (:syntax '|ExpObjectEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "Information about an object.  An application uses
     expObjectEntryStatus to create entries in this table while
     in the process of defining an expression.

     Values of read-create objects in this table may be
     changed at any time."))

(defclass |ExpObjectEntry| (sequence-type)
  ((|expObjectIndex| :type |Unsigned32|)
   (|expObjectID| :type object-id)
   (|expObjectIDWildcard| :type |TruthValue|)
   (|expObjectSampleType| :type integer)
   (|expObjectDeltaDiscontinuityID| :type object-id)
   (|expObjectDiscontinuityIDWildcard| :type |TruthValue|)
   (|expObjectDiscontinuityIDType| :type integer)
   (|expObjectConditional| :type object-id)
   (|expObjectConditionalWildcard| :type |TruthValue|)
   (|expObjectEntryStatus| :type |RowStatus|)))

(defoid |expObjectIndex| (|expObjectEntry| 1)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "Within an expression, a unique, numeric identification for an
     object.  Prefixed with a dollar sign ('$') this is used to
     reference the object in the corresponding expExpression."))

(defoid |expObjectID| (|expObjectEntry| 2)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The OBJECT IDENTIFIER (OID) of this object.  The OID may be
     fully qualified, meaning it includes a complete instance
     identifier part (e.g., ifInOctets.1 or sysUpTime.0), or it
     may not be fully qualified, meaning it may lack all or part
     of the instance identifier.  If the expObjectID is not fully
     qualified, then expObjectWildcard must be set to true(1).
     The value of the expression will be multiple
     values, as if done for a GetNext sweep of the object.

     An object here may itself be the result of an expression but
     recursion is not allowed.

     NOTE:  The simplest implementations of this MIB may not allow
     wildcards."))

(defoid |expObjectIDWildcard| (|expObjectEntry| 3)
  (:type 'object-type)
  (:syntax '|TruthValue|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "A true value indicates the expObjecID of this row is a wildcard
        object. False indicates that expObjectID is fully instanced.
        If all expObjectWildcard values for a given expression are FALSE,

        expExpressionPrefix will reflect a scalar object (i.e. will
        be 0.0).

        NOTE:  The simplest implementations of this MIB may not allow
        wildcards."))

(defoid |expObjectSampleType| (|expObjectEntry| 4)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The method of sampling the selected variable.

     An 'absoluteValue' is simply the present value of the object.

     A 'deltaValue' is the present value minus the previous value,
     which was sampled expExpressionDeltaInterval seconds ago.
     This is intended primarily for use with SNMP counters, which are
     meaningless as an 'absoluteValue', but may be used with any
     integer-based value.

     A 'changedValue' is a boolean for whether the present value is
     different from the previous value.  It is applicable to any data
     type and results in an Unsigned32 with value 1 if the object's
     value is changed and 0 if not.  In all other respects it is as a
     'deltaValue' and all statements and operation regarding delta
     values apply to changed values.

     When an expression contains both delta and absolute values
     the absolute values are obtained at the end of the delta
     period."))

(defoid |sysUpTimeInstance| (|sysUpTime| 0) (:type 'object-identity))

(defoid |expObjectDeltaDiscontinuityID| (|expObjectEntry| 5)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The OBJECT IDENTIFIER (OID) of a TimeTicks, TimeStamp, or
     DateAndTime object that indicates a discontinuity in the value
     at expObjectID.


     This object is instantiated only if expObjectSampleType is
     'deltaValue' or 'changedValue'.

     The OID may be for a leaf object (e.g. sysUpTime.0) or may
     be wildcarded to match expObjectID.

     This object supports normal checking for a discontinuity in a
     counter.  Note that if this object does not point to sysUpTime
     discontinuity checking must still check sysUpTime for an overall
     discontinuity.

     If the object identified is not accessible no discontinuity
     check will be made."))

(defoid |expObjectDiscontinuityIDWildcard| (|expObjectEntry| 6)
  (:type 'object-type)
  (:syntax '|TruthValue|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "A true value indicates the expObjectDeltaDiscontinuityID of
     this row is a wildcard object.  False indicates that
     expObjectDeltaDiscontinuityID is fully instanced.

     This object is instantiated only if expObjectSampleType is
     'deltaValue' or 'changedValue'.

     NOTE:  The simplest implementations of this MIB may not allow
     wildcards."))

(defoid |expObjectDiscontinuityIDType| (|expObjectEntry| 7)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The value 'timeTicks' indicates the expObjectDeltaDiscontinuityID
     of this row is of syntax TimeTicks.  The value 'timeStamp' indicates
     syntax TimeStamp.  The value 'dateAndTime indicates syntax
     DateAndTime.

     This object is instantiated only if expObjectSampleType is
     'deltaValue' or 'changedValue'."))

(defoid |expObjectConditional| (|expObjectEntry| 8)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The OBJECT IDENTIFIER (OID) of an object that overrides
     whether the instance of expObjectID is to be considered
     usable.  If the value of the object at expObjectConditional
     is 0 or not instantiated, the object at expObjectID is
     treated as if it is not instantiated.  In other words,
     expObjectConditional is a filter that controls whether or
     not to use the value at expObjectID.

     The OID may be for a leaf object (e.g. sysObjectID.0) or may be
     wildcarded to match expObjectID.  If expObject is wildcarded and
     expObjectID in the same row is not, the wild portion of
     expObjectConditional must match the wildcarding of the rest of
     the expression.  If no object in the expression is wildcarded
     but expObjectConditional is, use the lexically first instance
     (if any) of expObjectConditional.

     If the value of expObjectConditional is 0.0 operation is
     as if the value pointed to by expObjectConditional is a
     non-zero (true) value.

     Note that expObjectConditional can not trivially use an object
     of syntax TruthValue, since the underlying value is not 0 or 1."))

(defoid |expObjectConditionalWildcard| (|expObjectEntry| 9)
  (:type 'object-type)
  (:syntax '|TruthValue|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "A true value indicates the expObjectConditional of this row is
     a wildcard object. False indicates that expObjectConditional is
     fully instanced.

     NOTE: The simplest implementations of this MIB may not allow
     wildcards."))

(defoid |expObjectEntryStatus| (|expObjectEntry| 10)
  (:type 'object-type)
  (:syntax '|RowStatus|)
  (:max-access '|read-create|)
  (:status '|current|)
  (:description
   "The control that allows creation/deletion of entries.

     Objects in this table may be changed while
     expObjectEntryStatus is in any state."))

(defoid |expValueTable| (|expValue| 1)
  (:type 'object-type)
  (:syntax '(vector |ExpValueEntry|))
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description "A table of values from evaluated expressions."))

(defoid |expValueEntry| (|expValueTable| 1)
  (:type 'object-type)
  (:syntax '|ExpValueEntry|)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "A single value from an evaluated expression.  For a given
     instance, only one 'Val' object in the conceptual row will be
     instantiated, that is, the one with the appropriate type for
     the value.  For values that contain no objects of
     expObjectSampleType 'deltaValue' or 'changedValue', reading a
     value from the table causes the evaluation of the expression
     for that value.  For those that contain a 'deltaValue' or
     'changedValue' the value read is as of the last sampling
     interval.

     If in the attempt to evaluate the expression one or more
     of the necessary objects is not available, the corresponding
     entry in this table is effectively not instantiated.

     To maintain security of MIB information, when creating a new
     row in this table, the managed system must record the security
     credentials of the requester.  These security credentials are
     the parameters necessary as inputs to isAccessAllowed from
     [RFC2571]. When obtaining the objects that make up the
     expression, the system must (conceptually) use isAccessAllowed to
     ensure that it does not violate security.

     The evaluation of that expression takes place under the

     security credentials of the creator of its expExpressionEntry.

     To maintain security of MIB information, expression evaluation must
     take place using security credentials for the implied Gets of the
     objects in the expression as inputs (conceptually) to
     isAccessAllowed from the Architecture for Describing SNMP
     Management Frameworks.  These are the security credentials of the
     creator of the corresponding expExpressionEntry."))

(defclass |ExpValueEntry| (sequence-type)
  ((|expValueInstance| :type object-id)
   (|expValueCounter32Val| :type |Counter32|)
   (|expValueUnsigned32Val| :type |Unsigned32|)
   (|expValueTimeTicksVal| :type |TimeTicks|)
   (|expValueInteger32Val| :type |Integer32|)
   (|expValueIpAddressVal| :type |IpAddress|)
   (|expValueOctetStringVal| :type t)
   (|expValueOidVal| :type object-id)
   (|expValueCounter64Val| :type |Counter64|)))

(defoid |expValueInstance| (|expValueEntry| 1)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|not-accessible|)
  (:status '|current|)
  (:description
   "The final instance portion of a value's OID according to
     the wildcarding in instances of expObjectID for the
     expression.  The prefix of this OID fragment is 0.0,
     leading to the following behavior.

     If there is no wildcarding, the value is 0.0.0.  In other
     words, there is one value which standing alone would have
     been a scalar with a 0 at the end of its OID.

     If there is wildcarding, the value is 0.0 followed by
     a value that the wildcard can take, thus defining one value
     instance for each real, possible value of the wildcard.
     So, for example, if the wildcard worked out to be an ifIndex,
     there is an expValueInstance for each applicable ifIndex."))

(defoid |expValueCounter32Val| (|expValueEntry| 2)
  (:type 'object-type)
  (:syntax '|Counter32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'counter32'."))

(defoid |expValueUnsigned32Val| (|expValueEntry| 3)
  (:type 'object-type)
  (:syntax '|Unsigned32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'unsigned32'."))

(defoid |expValueTimeTicksVal| (|expValueEntry| 4)
  (:type 'object-type)
  (:syntax '|TimeTicks|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'timeTicks'."))

(defoid |expValueInteger32Val| (|expValueEntry| 5)
  (:type 'object-type)
  (:syntax '|Integer32|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'integer32'."))

(defoid |expValueIpAddressVal| (|expValueEntry| 6)
  (:type 'object-type)
  (:syntax '|IpAddress|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'ipAddress'."))

(defoid |expValueOctetStringVal| (|expValueEntry| 7)
  (:type 'object-type)
  (:syntax 't)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'octetString'."))

(defoid |expValueOidVal| (|expValueEntry| 8)
  (:type 'object-type)
  (:syntax 'object-id)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description "The value when expExpressionValueType is 'objectId'."))

(defoid |expValueCounter64Val| (|expValueEntry| 9)
  (:type 'object-type)
  (:syntax '|Counter64|)
  (:max-access '|read-only|)
  (:status '|current|)
  (:description
   "The value when expExpressionValueType is 'counter64'."))

(defoid |dismanExpressionMIBConformance| (|dismanExpressionMIB| 3)
  (:type 'object-identity))

(defoid |dismanExpressionMIBCompliances|
        (|dismanExpressionMIBConformance| 1)
  (:type 'object-identity))

(defoid |dismanExpressionMIBGroups|
        (|dismanExpressionMIBConformance| 2)
  (:type 'object-identity))

(defoid |dismanExpressionMIBCompliance|
        (|dismanExpressionMIBCompliances| 1)
  (:type 'module-compliance)
  (:status '|current|)
  (:description
   "The compliance statement for entities which implement
          the Expression MIB."))

(defoid |dismanExpressionResourceGroup| (|dismanExpressionMIBGroups| 1)
  (:type 'object-group)
  (:status '|current|)
  (:description "Expression definition resource management."))

(defoid |dismanExpressionDefinitionGroup|
        (|dismanExpressionMIBGroups| 2)
  (:type 'object-group)
  (:status '|current|)
  (:description "Expression definition."))

(defoid |dismanExpressionValueGroup| (|dismanExpressionMIBGroups| 3)
  (:type 'object-group)
  (:status '|current|)
  (:description "Expression value."))

(eval-when (:load-toplevel :execute)
  (pushnew 'disman-expression-mib *mib-modules*)
  (setf *current-module* nil))

