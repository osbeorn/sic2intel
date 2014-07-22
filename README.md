#Sic2Intel - a SIC/XE to Intel Pentium x86 assemly code translator

##1. Instructions for running the project in Eclipse

This project uses two custom builders **JFlex** and **JCup**. Both are included in this repository and should work out of the box, but you still have to chack some of the configured paths by going through the following instructions:

###1.1. On Windows

####1.1.1. JFlex builder

- Modify the *jflex.bat* file in *ext_tools/jflex-1.4.3/bin* by seting the *JAVA_HOME* variable so that it point to your Java directory on your system,
- In *Project properties/Builders/JFlex* make sure that the **Location** points to *ext_tools/jflex-1.4.3/bin/jflex.bat* file and that the **Working directory** points to *src/sic2intel/lexer* directory,
- The **Arguments** section should contain only *sic.jflex*,
- On the **Refresh** tab select *Refresh resources upon completion*, *The project containing the selected resource* and *Recursively include sub-folders*,
- On the **Build Options** tab select *Allocate Console*, *After a "Clean"*, *During manual builds*, *During auto builds*, *During a "Clean"* and *Specify working set of relevant resources*, where you have to specify the following resource: **src/sic2intel/lexer/sic.jflex**.

####1.1.2. JCup builder

- In *Project properties/Builders/JCup* make sure that the **Location** points to *java.exe* installed on your system and that the **Working directory** points to *src/sic2intel/parser* directory,
- The **Arguments** section should contain *-jar ${workspace_loc}/../ext_tools/java-cup-11a.jar -package parser -parser SicSyntax -symbols SicTokens -nonterms -expect 1 sic.cup*,
- On the **Refresh** tab select *Refresh resources upon completion*, *The project containing the selected resource* and *Recursively include sub-folders*,
- On the **Build Options** tab select *Allocate Console*, *After a "Clean"*, *During manual builds*, *During auto builds*, *During a "Clean"* and *Specify working set of relevant resources*, where you have to specify the following resource: **src/sic2intel/parser/sic.cup**.

###1.2. On Linux

####1.2.1. JFlex builder

- In *Project properties/Builders/JFlex* make sure that the **Location** points to *ext_tools/jflex-1.4.3/bin/jflex* file and that the **Working directory** points to *src/sic2intel/lexer* directory,
- The **Arguments** section should contain only *sic.jflex*,
- On the **Refresh** tab select *Refresh resources upon completion*, *The project containing the selected resource* and *Recursively include sub-folders*,
- On the **Build Options** tab select *Allocate Console*, *After a "Clean"*, *During manual builds*, *During auto builds*, *During a "Clean"* and *Specify working set of relevant resources*, where you have to specify the following resource: **src/sic2intel/lexer/sic.jflex**.

####1.2.2. JCup builder

- In *Project properties/Builders/JCup* make sure that the **Location** points to *java.exe* installed on your system and that the **Working directory** points to *src/sic2intel/parser* directory,
- The **Arguments** section should contain *-jar ${workspace_loc}/../ext_tools/java-cup-11a.jar -package parser -parser SicSyntax -symbols SicTokens -nonterms -expect 1 sic.cup*,
- On the **Refresh** tab select *Refresh resources upon completion*, *The project containing the selected resource* and *Recursively include sub-folders*,
- On the **Build Options** tab select *Allocate Console*, *After a "Clean"*, *During manual builds*, *During auto builds*, *During a "Clean"* and *Specify working set of relevant resources*, where you have to specify the following resource: **src/sic2intel/parser/sic.cup**.