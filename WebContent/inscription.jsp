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
  <h:form>
  <h:outputText value ="Bienvenue sur notre Site"/><br><hr>
  <h:outputText value ="Inscription"/><br>
  <h:panelGrid columns ="2">
     <h:outputText value="nom :"/> 
     <h:inputText value="#{loginBean.nom}" required="true"/> 
     <h:outputText value="Prenom :"/> 
     <h:inputText value="#{loginBean.prenom}" required="true"/> 
     <h:outputText value="Login :"/> 
     <h:inputText value="#{loginBean.username}" required="true"/> 
     <h:outputText value="Mot De passe :"/> 
     <h:inputSecret value="#{loginBean.password}" required="true"/> 
     <h:outputText value="Email :"/> 
     <h:inputText value="#{loginBean.email}" id ="email" required="true">
       <f:validator validatorId="emailValidator" /> 
     </h:inputText>
   </h:panelGrid>
  <h:commandButton value="Enregistrer" action="#{loginBean.enregistrerPerson}"/><br><br>
   <font color =RED><b><h:message for="email" /></b></font><br>
 </h:form>

   <h:outputLink value="acceuil.jsf">
		<h:outputText value="Home" />
	</h:outputLink>
</f:view>   