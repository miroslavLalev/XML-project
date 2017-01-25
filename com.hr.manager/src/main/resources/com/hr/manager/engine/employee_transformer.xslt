<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output encoding="UTF-8" indent="yes" method="xml"
		standalone="no" omit-xml-declaration="no" />
	<xsl:template match="firm">
		<fo:root language="IT">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="firm"
					page-height="297mm" page-width="210mm" margin-top="5mm"
					margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
					<fo:region-body margin-top="25mm" margin-bottom="20mm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="firm">
				<fo:flow flow-name="xsl-region-body" border-collapse="collapse"
					reference-orientation="0">
					<fo:block>Employees</fo:block>
					<fo:table table-layout="fixed" width="100%" font-size="10pt" border="solid"
						border-color="black" border-width="0.35mm" border-style="solid"
						text-align="center" display-align="center" space-after="5mm" border-collapse="collapse">
						<fo:table-column column-width="proportional-column-width(20)" />
						<fo:table-column column-width="proportional-column-width(10)" />
						<fo:table-column column-width="proportional-column-width(20)" />
						<fo:table-column column-width="proportional-column-width(10)" />
						<fo:table-column column-width="proportional-column-width(15)" />
						<fo:table-column column-width="proportional-column-width(20)" />
						<fo:table-body font-size="95%">
							<fo:table-row height="8mm">
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Name</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Salary</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Competences</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Rank</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Education</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid 0.1mm black">
									<fo:block>Contract</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="employees/employee">
								<fo:table-row>
									<fo:table-cell border="solid 0.1mm black">
										<fo:block>
											<xsl:value-of select="name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid 0.1mm black">
										<fo:block>
											<xsl:value-of select="salary" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid 0.1mm black">
										<fo:block>
											<xsl:value-of select="competences" />
										</fo:block>
									</fo:table-cell>
									<xsl:variable name="employeeID" select="@employeeID" />
									<xsl:for-each select="/firm/groups/groupsRank/*">
										<xsl:if test="contains(@employeeIDs, $employeeID)">
											<fo:table-cell border="solid 0.1mm black">
												<fo:block>
													<xsl:value-of select="local-name()" />
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/firm/groups/groupsEducation/*">
										<xsl:if test="contains(@employeeIDs, $employeeID)">
											<fo:table-cell border="solid 0.1mm black">
												<fo:block>
													<xsl:value-of select="local-name()" />
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="/firm/groups/groupsContract/*">
										<xsl:if test="contains(@employeeIDs, $employeeID)">
											<fo:table-cell border="solid 0.1mm black">
												<fo:block>
													<xsl:value-of select="local-name()" />
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>