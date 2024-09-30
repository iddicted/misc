#!/bin/bash
# Author: @iddicted
xml_file="~/Library/Preferences/file.xml"

#check if xml file exists
if [ -f xml_file ]; then
    echo "file already exists"
else
    # create the xml file
    touch ~/Library/Preferences/sap_gui.xml
    echo "created xml file at ${xml_file}"


# Define the XML content
xml_content="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<root>
    <element1>Value1</element1>
    <element2>Value2</element2>
</root>"


# Write the XML content to the file
echo "$xml_content" > "$output_file"

# Print a message indicating success
echo "XML file '$output_file' created successfully."
