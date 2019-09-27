<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<h1>EL - Expression Language</h1>

<section class="p-3 mb-3 bg-light">
	<p>
			El lenguaje de expresiones comenzó como una parte de la&nbsp;<a
				href="http://es.wikipedia.org/wiki/JavaServer_Pages_Standard_Tag_Library"
				title="JavaServer Pages Standard Tag Library">JavaServer Pages
				Standard Tag Library (JSTL)</a>&nbsp;y fue llamado originalmente SPEL
			(Simplest Possible Expression Language), y después simplemente&nbsp;<b>Expression
				Language</b>&nbsp;(EL). Era un lenguaje de script que permitía el acceso
			a los componentes de&nbsp;<a
				href="http://es.wikipedia.org/wiki/Plataforma_Java"
				title="Plataforma Java">Java</a>&nbsp;(<a
				href="http://es.wikipedia.org/wiki/JavaBean" title="JavaBean">JavaBeans</a>)
			a través de&nbsp;<a
				href="http://es.wikipedia.org/wiki/JavaServer_Pages"
				title="JavaServer Pages">JSP</a>. Desde&nbsp;<a
				href="http://es.wikipedia.org/wiki/JavaServer_Pages"
				title="JavaServer Pages">JSP 2.0</a>, se ha utilizado dentro de las
			etiquetas&nbsp;<a
				href="http://es.wikipedia.org/wiki/JavaServer_Pages"
				title="JavaServer Pages">JSP</a>&nbsp;para separar el código Java de
			JSP, y para permitir un acceso más fácil a los componentes de Java
			(que en código Java).
		</p>
		<p>
			Con los años, el lenguaje de expresiones ha evolucionado para incluir
			una funcionalidad más avanzada y fue incluido en la especificación
			JSP 2.0. El scripting se hizo más fácil para los diseñadores de
			contenido web que tienen poco o prácticamente ningún conocimiento del
			núcleo del lenguaje Java. Este lenguaje de script convirtió
			verdaderamente a JSP en un lenguaje de script. Antes de EL, JSP
			consistía en algunas etiquetas especiales como&nbsp;<a
				href="http://es.wikipedia.org/w/index.php?title=Scriptlet&amp;action=edit&amp;redlink=1"
				title="Scriptlet (aún no redactado)">scriptlets</a>, expresiones,
			etc. dentro de las cuales el código Java era escrito de forma
			explícita. Con EL el diseñador de contenido web sólo necesita saber
			cómo hacer las llamadas apropiadas a los métodos básicos de Java.
		</p>
		<p>
			EL era, tanto sintáctica como semánticamente, similar a las
			expresiones de&nbsp;<a href="http://es.wikipedia.org/wiki/JavaScript"
				title="JavaScript">JavaScript</a>:
		</p>
		<ul>
			<li>no hay conversión de tipos explícita</li>
			<li>las conversiones de tipos se hacen generalmente de forma
				implícita</li>
			<li>las comillas dobles y simples son equivalentes</li>
			<li><code>objeto.propiedad</code>&nbsp;tiene el mismo
				significado que&nbsp;<code>objeto.getProperty()</code></li>
		</ul>
		<p id="yui_3_17_2_1_1563430340310_23">
			EL también liberó al programador de tener que conocer las
			particularidades de cómo se accede en realidad a los valores:&nbsp;
			<code id="yui_3_17_2_1_1563430340310_22">objeto.propiedad</code>
			puede significar (dependiendo de qué&nbsp;
			<code>objeto</code>
			&nbsp;se trata) o bien&nbsp;
			<code>object.get("propiedad")</code>
			&nbsp;o&nbsp;
			<code>object.getProperty("propiedad")</code>
			&nbsp;o&nbsp;
			<code>object.getPropiedad()</code>
			, etc.
		</p>
		<p>
			Durante el desarrollo de JSP 2.0, la tecnología&nbsp;<a
				href="http://es.wikipedia.org/wiki/JavaServer_Faces"
				title="JavaServer Faces">JavaServer Faces</a>&nbsp;fue publicada, la
			cual también necesitaba un lenguaje de expresiones, pero el lenguaje
			de expresiones definido en la especificación JSP 2.0 no satisfacía
			todas las necesidades para el desarrollo con la tecnología JSF. La
			limitación más obvia es que sus expresiones son evaluadas de
			inmediato. Y también, los componentes de JSF necesitan una manera de
			invocar métodos de objetos del lado del servidor. Un lenguaje más
			poderoso fue creado con las siguientes nuevas características:
		</p>
		<ul>
			<li>Expresiones diferidas, que no se evalúan de inmediato</li>
			<li>Expresiones que pueden establecer (set), así como recuperar
				datos (get)</li>
			<li>Expresiones de métodos, que pueden invocar métodos</li>
		</ul>
		<p>El nuevo lenguaje de expresiones funcionó bien para los fines
			de JSF. Pero los desarrolladores tenían problemas en la integración
			de JSP EL con JSF EL debido a conflictos. Debido a estas
			incompatibilidades, la iniciativa "lenguaje de expresión unificado"
			comenzó para unificar estos lenguajes de expresiones. A partir de JSP
			2.1, los lenguajes de expresión de JSP 2.0 y JSF 1.1 se han fusionado
			en un solo lenguaje de expresiones unificado (EL 2.1).</p>
		<p>
			<br>
		</p>
		<h2>
			<span id="Caracter.C3.ADsticas">Características</span>
		</h2>
		<p>El nuevo EL unificado es una unión de los lenguajes de
			expresiones de JSP y JSF. Además de las características ya
			disponibles en el EL de JSP, el EL unificado tiene las siguientes
			características:</p>
		<ul>
			<li>Evaluación diferida</li>
			<li>Soporte para expresiones que pueden establecer valores y
				expresiones que pueden invocar métodos</li>
			<li>Una API usable para resolver expresiones</li>
		</ul>
		<h2>
			<span id="Ejemplos">Ejemplos</span>
		</h2>
		<p>Esto muestra un ejemplo sencillo de Unified EL siendo utilizado
			dentro de una etiqueta JSTL "c:out":</p>
		<pre id="yui_3_17_2_1_1563430340310_26">&lt;c:out value="${myBean.myField}" /&gt;</pre>
		<p>Una expresión que llama a un método con un parámetro:</p>
		<pre id="yui_3_17_2_1_1563430340310_27">${myBean.addNewOrder('orderName')}</pre>
		<h2>
			Operadores<br>
		</h2>
		<p>JSP Expression Language (EL) soporta operadores logicos y
			aritmeticos de Java. Listado de los operadores mas comunes:</p>
		<table>
			<tbody>
				<tr>
					<th>Operator</th>
					<th>Description</th>
				</tr>
				<tr>
					<td>.</td>
					<td>Access a bean property or Map entry</td>
				</tr>
				<tr>
					<td>[]</td>
					<td>Access an array or List element</td>
				</tr>
				<tr>
					<td>()</td>
					<td>Group a subexpression to change the evaluation order</td>
				</tr>
				<tr>
					<td>+</td>
					<td>Addition</td>
				</tr>
				<tr>
					<td>-</td>
					<td>Subtraction or negation of a value</td>
				</tr>
				<tr>
					<td>*</td>
					<td>Multiplication</td>
				</tr>
				<tr>
					<td>/ or div</td>
					<td>Division</td>
				</tr>
				<tr>
					<td>% or mod</td>
					<td>Modulo (remainder)</td>
				</tr>
				<tr>
					<td>== or eq</td>
					<td>Test for equality</td>
				</tr>
				<tr>
					<td>!= or ne</td>
					<td>Test for inequality</td>
				</tr>
				<tr>
					<td>&lt; or lt</td>
					<td>Test for less than</td>
				</tr>
				<tr>
					<td>&gt; or gt</td>
					<td>Test for greater than</td>
				</tr>
				<tr>
					<td>&lt;= or le</td>
					<td>Test for less than or equal</td>
				</tr>
				<tr>
					<td>&gt;= or gt</td>
					<td>Test for greater than or equal</td>
				</tr>
				<tr>
					<td>&amp;&amp; or and</td>
					<td>Test for logical AND</td>
				</tr>
				<tr>
					<td>|| or or</td>
					<td>Test for logical OR</td>
				</tr>
				<tr>
					<td>! or not</td>
					<td>Unary Boolean complement</td>
				</tr>
				<tr>
					<td>empty</td>
					<td>Test for empty variable values</td>
				</tr>
			</tbody>
		</table>
		<pre></pre>
		<h2>Objetos Implicitos:</h2>
		<p>
			<br>
		</p>
		<p></p>
		<table id="yui_3_17_2_1_1563430340310_31">
			<tbody id="yui_3_17_2_1_1563430340310_30">
				<tr>
					<th>Implicit object</th>
					<th>Description</th>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_29">
					<td id="yui_3_17_2_1_1563430340310_28">pageScope</td>
					<td>Scoped variables from page scope</td>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_33">
					<td id="yui_3_17_2_1_1563430340310_32">requestScope</td>
					<td>Scoped variables from request scope</td>
				</tr>
				<tr>
					<td>sessionScope</td>
					<td>Scoped variables from session scope</td>
				</tr>
				<tr>
					<td>applicationScope</td>
					<td>Scoped variables from application scope</td>
				</tr>
				<tr>
					<td>param</td>
					<td>Request parameters as strings</td>
				</tr>
				<tr>
					<td>paramValues</td>
					<td>Request parameters as collections of strings</td>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_35">
					<td id="yui_3_17_2_1_1563430340310_34">header</td>
					<td>HTTP request headers as strings</td>
				</tr>
				<tr>
					<td>headerValues</td>
					<td>HTTP request headers as collections of strings</td>
				</tr>
				<tr>
					<td>initParam</td>
					<td>Context-initialization parameters</td>
				</tr>
				<tr>
					<td><a class="autolink" title="Cookie"
						href="http://www.campus.formacion.ipartek.com/moodle/mod/url/view.php?id=722">cookie</a></td>
					<td><a class="autolink" title="Cookie"
						href="http://www.campus.formacion.ipartek.com/moodle/mod/url/view.php?id=722">Cookie</a>
						values</td>
				</tr>
				<tr>
					<td>pageContext</td>
					<td>The JSP PageContext object for the current page</td>
				</tr>
			</tbody>
		</table>
		
		<h2>Palabras Reservadas</h2>
		
		<table cellspacing="0" cellpadding="10" border="1" width="100%"
			id="yui_3_17_2_1_1563430340310_41">
			<tbody id="yui_3_17_2_1_1563430340310_40">
				<tr>
					<td align="left" valign="top"><p>
							<tt>and</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>or</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>not</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>eq</tt>
						</p></td>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_49">
					<td align="left" valign="top"><p>
							<tt>ne</tt>
						</p></td>
					<td align="left" valign="top" id="yui_3_17_2_1_1563430340310_48"><p
							id="yui_3_17_2_1_1563430340310_47">
							<tt id="yui_3_17_2_1_1563430340310_46">lt</tt>
						</p></td>
					<td align="left" valign="top" id="yui_3_17_2_1_1563430340310_52"><p
							id="yui_3_17_2_1_1563430340310_51">
							<tt id="yui_3_17_2_1_1563430340310_50">gt</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>le</tt>
						</p></td>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_45">
					<td align="left" valign="top"><p>
							<tt>ge</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>true</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>false</tt>
						</p></td>
					<td align="left" valign="top" id="yui_3_17_2_1_1563430340310_44"><p
							id="yui_3_17_2_1_1563430340310_43">
							<tt id="yui_3_17_2_1_1563430340310_42">null</tt>
						</p></td>
				</tr>
				<tr id="yui_3_17_2_1_1563430340310_39">
					<td align="left" valign="top"><p>
							<tt>instanceof</tt>
						</p></td>
					<td align="left" valign="top" id="yui_3_17_2_1_1563430340310_38"><p
							id="yui_3_17_2_1_1563430340310_37">
							<tt id="yui_3_17_2_1_1563430340310_36">empty</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>div</tt>
						</p></td>
					<td align="left" valign="top"><p>
							<tt>mod</tt>
						</p></td>
				</tr>
			</tbody>
		</table>


		<h2>Ejemplos</h2>
		
		<p><code>&dollar;{ 2 + 2 } = ${2 + 2}</code></p>
		<p><code>&dollar;{ 2 > 4 } = ${2 > 4}</code></p>
		
		
		<jsp:useBean id="colores" class="java.util.ArrayList" scope="request"/>		

		TODO *mirar como meter valores en array
	
		${requestScope.colores}	
			
		
		
		
	
</section>




<%@include file="../includes/footer.jsp"%>