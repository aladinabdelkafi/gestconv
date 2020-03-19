<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml"
    	xmlns:h="http://java.sun.com/jsf/html"
    	xmlns:f="http://java.sun.com/jsf/core"
        xmlns:t="http://myfaces.apache.org/tomahawk">
<%--@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t"--%>
<%--@ taglib uri="http://java.sun.com/jsf/html" prefix="h"--%>
<%--@ taglib uri="http://java.sun.com/jsf/core" prefix="f"--%>
<f:view>
 <h:outputText value=" connection reussi..."/><br>
 <h2><h:outputText value="Bienvenue #{loginBean.nom} #{loginBean.prenom}"/></h2><br><hr>
 <h:outputText value="voiçi la liste des membres enregistrer :"/>
 <h:form>
 <h:dataTable value="#{personBean.personnes}" var="person" border="1">
   <h:column>
     <f:facet name="header">
      <f:verbatim>Nom</f:verbatim>
     </f:facet>
     <h:outputText value="#{person.nom}"/>
   </h:column>
   
   <h:column>
     <f:facet name="header">
      <f:verbatim>Prénom</f:verbatim>
     </f:facet>
     <h:outputText value="#{person.prenom}"/>
   </h:column>
 </h:dataTable>
 </h:form>
  <h:outputLink value="acceuil.jsf">
		<h:outputText value="Home" />
	</h:outputLink>
</f:view>