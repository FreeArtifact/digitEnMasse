<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="3.0">
    <p:input port="source">
        <p:inline>
            <music>
                <artist name="The Clash">
                    <album title="The Clash"/>
                    <album title="Give 'Em Enough Rope"/>
                    <album title="London Calling"/>
                </artist>
                <artist name="Dead Kennedys">
                    <album title="Fresh Fruit for Rotting Vegetables"/>
                </artist>
                <artist name="U2"/>
            </music>
        </p:inline>
    </p:input>
    <p:output port="result"/>
    <p:filter select="/music/artist[@name = 'Dead Kennedys']/album[1]"/>
    <p:add-attribute attribute-name="desc"
                     attribute-value="gross"/>
</p:declare-step>