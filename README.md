#Sic2Intel - a SIC/XE to Intel Pentium x86 assembly code translator

##1. Running the project in Eclipse

This project uses two custom builders **JFlex** and **JCup**. Both Windows and Linux versions of the builders are included in this repository. The configuration files can be found in *project/SICXE_2_INTELx86/.externalToolBuilders*. To use the included builders  just rename the appropriate files by removing the **windows** or **linux** extension according to your environment. These configuration files should work out of the box, but you should still check some of the configured paths by going through the following instructions:

###1.1. On Windows

####1.1.1. JFlex builder

- Modify the *jflex.bat* file in *ext_tools/jflex-1.4.3/bin* by seting the *JAVA_HOME* variable so that it points to your Java directory on your system,
- In *Project properties/Builders/JFlex* make sure that the **Location** points to *ext_tools/jflex-1.4.3/bin/jflex.bat* file and that the **Working directory** points to *src/sic2intel/lexer* directory,
- The **Arguments** section should contain only *sic.jflex*,
- On the **Refresh** tab select *Refresh resources upon completion*, *The project containing the selected resource* and *Recursively include sub-folders*,
- On the **Build Options** tab select *Allocate Console*, *After a "Clean"*, *During manual builds*, *During auto builds*, *During a "Clean"* and *Specify working set of relevant resources*, where you have to specify the following resource: **src/sic2intel/lexer/sic.jflex**.

####1.1.2. JCup builder

- In *Project properties/Builders/JCup* make sure that the **Location** points to your *java* executable installed on your system and that the **Working directory** points to *src/sic2intel/parser* directory,
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

##2. Creating a *.jar* executable

After successfully building the project you can create an executable *.jar* file, that makes it easier to use the translator tool. To create an executable *.jar* file, right-click the project in Eclipse, under *Java* select **Runnable JAR file** and click **Next**. On the next page select the **Main - SICXE_2_INTELx86** *Launch configuration*, select an *Export destination*, select *Package required libraries into generated JAR* and click **Finish**.

##3. Using the translator tool

- Run the project in Eclipse or run the previously generated *.jar* file.
- Select a SIC/XE *.asm* file
- Optionally select the *debug output* option, which adds source SIC/XE instructions as comments in the translated program.
- Press **Translate**.
  - If successful, a translated Intel x86 *_out.asm* file should appear next to the source file.
  - If unsuccessful, a warning will and instruct you to check the generated *.log* file.
  
There are several SIC/XE example programs in the *examples* folder. Check them out!