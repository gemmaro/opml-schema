<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
                xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
                exclude-result-prefixes="rng">
    <xsl:template match="rng:grammar">
        <xsl:copy>
            <xsl:attribute name="a:documentation" xml:lang="en">Add flNumberedSubs element, URL update socket element, last cursor element, and owner Twitter screen name element.</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="rng:element[@name='head']/
                         rng:interleave/
                         rng:optional[rng:element[@name='ownerId']]">
        <xsl:copy-of select="."/>
        <optional xmlns="http://relaxng.org/ns/structure/1.0">
            <element name="ownerTwitterScreenName">
                <a:documentation xml:lang="en">The Twitter screen name of the owner, used to identify the owner on Twitter. This should be a valid Twitter username without the '@' symbol. Used in the OPML 2.0 Spec (http://opml.org/spec2.opml?format=opml).</a:documentation>
                <data type="string"/>
            </element>
        </optional>
    </xsl:template>
    <xsl:template match="rng:element[@name='head']/
                         rng:interleave/
                         rng:optional[rng:element[@name='windowRight']]"
                  xmlns="http://relaxng.org/ns/structure/1.0">
        <xsl:copy-of select="."/>
        <optional>
            <element name="lastCursor">
                <a:documentation xml:lang="en">Used in the OPML 2.0 Spec (http://opml.org/spec2.opml?format=opml).</a:documentation>
                <data type="int"/>
            </element>
        </optional>
        <optional>
            <element name="urlUpdateSocket">
                <a:documentation xml:lang="en">The URL of the WebSocket endpoint for receiving real-time updates. This URI should point to a valid WebSocket server that clients can connect to in order to receive notifications or updates related to the data being managed. Used in the OPML 2.0 Spec (http://opml.org/spec2.opml?format=opml).</a:documentation>
                <data type="anyURI"/>
            </element>
        </optional>
    </xsl:template>
    <xsl:template match="rng:optional[rng:attribute[@name='created']]"
                  xmlns="http://relaxng.org/ns/structure/1.0">
        <xsl:copy-of select="."/>
        <optional>
            <attribute name="flNumberedSubs">
                <a:documentation>Used in the OPML 2.0 Spec (http://opml.org/spec2.opml?format=opml).</a:documentation>
                <data type="boolean"/>
            </attribute>
        </optional>
    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
