# IISBackdoorDetect
Detects IIS modules such as IIS-RAID

# Usage
Run script on an IIS Server. Will enumerate installed modules and write output for:
- Unsigned modules
- Modules not Microsoft signed

Set `$VerbosePreference = "continue"` before running to provide verbose scanning output.
