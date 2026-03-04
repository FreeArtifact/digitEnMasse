<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step name="meaningful-name" xmlns:p="http://www.w3.org/ns/xproc"
    exclude-inline-prefixes="#all" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ex="extensions"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0">
    
    <p:input port="source" primary="true" content-types="text/plain" href="zoom-transcript.txt"/>
    <p:invisible-xml cx:processor="markup-blitz">
        <!--ebb: As of now (version 28) oXygen will flag <p:invisible-xml> as an error. 
            Don't worry. It's not!  -->
        <p:with-input port="grammar">
            <p:document href="zoom-gram.ixml" content-type="text/plain"/>
        </p:with-input>
    </p:invisible-xml>
    <!--  You have to store your output! We've added an optional message to show you whether the invisible XML processed. -->
    <p:store name="simple-XML" href="pipe-output/gram-output.xml"/>
    <p:identity message="Stored some XML made by invisible XML grammar."/>
    
    <p:xslt>
        <!-- in case you ever want to use it. You might want  -->
        <!--    <p:with-input port="source">
            <p:pipe step="simple-XML" port="result"/>
        </p:with-input>-->
        <p:with-input port="stylesheet" href="identity-t.xsl"/>
    </p:xslt>
    <p:store name="john" href="pipe-output/identity-output.xml"/>
    <p:identity message="Conformed to social pressure."/>
    
    <p:xslt>
        <!-- in case you ever want to use it. You might want  -->
        <!--    <p:with-input port="source">
            <p:pipe step="simple-XML" port="result"/>
        </p:with-input>-->
        <p:with-input port="stylesheet" href="svg-trans.xsl"/>
    </p:xslt>
    <p:store name="john-oreilly" href="pipe-output/lines-output.svg"/>
    <p:identity message="Dying of liver failure: too much Tylenol."/>
    
    
</p:declare-step>