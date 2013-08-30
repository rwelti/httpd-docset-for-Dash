
The contents came from

$ wget "http://www.apache.org/dist/httpd/docs/httpd-docs-2.2.14.en.zip"

unzipped it to Contents/Resources/Documents, 

wrote script Contents/Resources/addEntry.ksh to scan the files.

invoked script using:

    find . -name "*html" -exec addEntry.ksh {} \;
