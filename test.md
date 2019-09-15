| Integration | Developer (Source) | Develoepr (Recipient)| (UAT) Initial Testing Status | V & V  | Frequency | Method | Starts | Ends | Comments |
|-------------|--------------------|----------------------|------------------------------|--------|-----------|--------|--------|------|----------|
| INT-050: KTO_PAYROLL_INPUTS | Krishna | Kurtis | Pending | pending | TBD | UTBD | TBD | TBD | ... |
| INT-050A: KTO_TIMEOFF_REQUESTS | Krishna | Kurtis | Pending | pending | TBD | TBD | TBD | TBD | ...|
| INT-050B: KTO_TIMEOFF_CORRECTIONS | Krishna | Kurtis | Pending | pending | TBD | TBD | TBD | TBD | ...|
| INT_037A: KTO_JPLPN_HCM_PMGW | Chris Tran | Chad | Pending | pending | TBD | TBD | TBD | TBD | ...|
| INT-014: KTI_ORGANIZATIONS | Basil | Vuong | Basil - 9/12 @3pm: Sent a full load of 835 records (no issues) | V&V request made to Vuong on 9/12 | TBD | TBD | TBD| TBD | ...|
| INT-015: KTI_GARNISHMENTS | Basil | Abul| Basil - 9/12 @3pm: Sent a full load of 70 records (no issues) | V&V request made to Abul on 9/12 | TBD | TBD | TBD| TBD | ...|
| INT-016: KTI_JPLCE_PAYROLL_HCM | Chad| Nan | Pending (not-null date changes)| pending | TBD | TBD | TBD | TBD | ... |
| INT-017: KTI_GL_TRANSACTIONS | Basil| Kenny N. | Basil - 9/12: attempted a large payload (120MB); but eneded up with a 404 error - This may be a timeout issue with Thuy - following up with Thy on 9/16. | pending | TBD | TBD | TBD | TBD | ... |
| INT-018: KTI_GL_EMPLOYEES | Basil| Vuong | Basil - 9/12: Sent an incremental load (28MB) - no issues; 9/12 pm: Uday: Ran incremental loads (changes made in WD)  - 1st run: connector terminated with failure. Restarted connector; payload came into Oracle. 2nd run: no issues; 3rd run: connector terminated with failure. Had to restart connector | It appears that Uday has been conducting ad-hoc testing on this integration| TBD | TBD | TBD | TBD | ... |
| INT-019: KTI_JPLPA_WORKDAY_INTF | Basil| Kenny N. | Basil - 9/12: Small pay loads were successful; Then ran a larger payload of 21MB and received a 502 bad gateway error | It appears tht Uday has been conducting ad-hoc testing on this integration| TBD | TBD | TBD | TBD | ... |
| INT-036A: KTI_KNS_EMPLOYEES | Kurtis| Krishna | Pending | Pending| TBD | TBD | TBD | TBD | ... |
| INT-036B: KTI_KNS_ACCRUALS | Kurtis| Krishna | 9/13 am: sent a full payload. Seems like the full payload of 32,178 Records were received; but then connector also displayed 'failure' status| Pending| TBD | TBD | TBD | TBD | ... |
| INT-062: KTI_JPLAP_HCM_EMP_BANK_ACCT | Uday| Dash | Pending | Pending| TBD | TBD | TBD | TBD | ... |
