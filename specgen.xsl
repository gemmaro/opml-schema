<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
                xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
                exclude-result-prefixes="rng a">
    <xsl:output method="html"/>
    <xsl:template match="rng:grammar">
        <html lang="en">
            <head>
                <title>OPML Grammar</title>
                <link rel="stylesheet"
                      href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css"/>
            </head>
            <body class="section">
                <nav class="navbar">
                    <div class="navbar-brand">OPML RELAX NG Schema</div>
                    <div class="navbar-menu">
                        <div class="navbar-end">
                            <a class="navbar-item"
                               href="https://github.com/gemmaro/opml-schema">GitHub</a>
                        </div>
                    </div>
                </nav>
                <div class="container">
                    <h1 class="title is-1">OPML Grammar</h1>
                    <article class="section">
                        <h2 class="title is-2">Elements</h2>
                        <xsl:apply-templates select="//rng:element">
                            <xsl:sort select="@name"/>
                        </xsl:apply-templates>
                    </article>
                    <article class="section">
                        <h2 class="title is-2">Attributes</h2>
                        <xsl:apply-templates select="//rng:attribute">
                            <xsl:sort select="@name"/>
                        </xsl:apply-templates>
                    </article>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="rng:element">
        <article id="#el_{@name}" class="section">
            <h3 class="title is-3">
                <xsl:value-of select="@name" />
            </h3>
            <xsl:if test="a:documentation">
                <div class="documentation">
                    <xsl:value-of select="a:documentation" />
                </div>
            </xsl:if>
        </article>
    </xsl:template>
    <xsl:template match="rng:attribute">
        <article id="#att_{@name}" class="section">
            <h3 class="title is-3">
                <xsl:value-of select="@name"/>
            </h3>
            <xsl:if test="a:documentation">
                <div class="documentation">
                    <xsl:value-of select="a:documentation" />
                </div>
            </xsl:if>
        </article>
    </xsl:template>
</xsl:stylesheet>
