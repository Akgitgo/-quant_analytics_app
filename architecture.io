<mxfile host="app.diagrams.net" agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36" version="29.2.7">
  <diagram name="Page-1" id="DnpPDHjOpPNlhVkPwapG">
    <mxGraphModel grid="1" page="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" pageScale="1" pageWidth="850" pageHeight="1100" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="dataSources" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="&lt;b&gt;DATA SOURCES&lt;/b&gt;" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="40" as="geometry" />
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-3" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fillColor=#1ba1e2;strokeColor=#006EAF;fontColor=#ffffff;" value="" vertex="1">
          <mxGeometry height="70" width="600" x="110" y="80" as="geometry" />
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-4" parent="zIAE92TZuHxJO3Z7oM7F-3" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" value="" vertex="1">
          <mxGeometry height="70" width="600" as="geometry" />
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-5" parent="zIAE92TZuHxJO3Z7oM7F-4" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="Binance Futures API" vertex="1">
          <mxGeometry height="70" width="197" as="geometry">
            <mxRectangle height="70" width="197" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-6" parent="zIAE92TZuHxJO3Z7oM7F-4" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="HTML WebSocket Tool" vertex="1">
          <mxGeometry height="70" width="196" x="197" as="geometry">
            <mxRectangle height="70" width="196" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-7" parent="zIAE92TZuHxJO3Z7oM7F-4" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="CSV Upload" vertex="1">
          <mxGeometry height="70" width="207" x="393" as="geometry">
            <mxRectangle height="70" width="207" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-9" edge="1" parent="1" style="endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="210" y="130" as="sourcePoint" />
            <mxPoint x="210" y="150" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-10" edge="1" parent="1" style="endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.82" y="130" as="sourcePoint" />
            <mxPoint x="409.82" y="150" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-11" edge="1" parent="1" style="endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="610" y="130" as="sourcePoint" />
            <mxPoint x="610" y="150" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-12" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.44" y="150" as="sourcePoint" />
            <mxPoint x="409" y="190" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-13" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="&lt;b&gt;INGESTION LAYER&lt;/b&gt;" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="190" as="geometry" />
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-14" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.47" y="360" as="sourcePoint" />
            <mxPoint x="410" y="400" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="zIAE92TZuHxJO3Z7oM7F-16" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=#60a917;strokeColor=#2D7600;fontColor=#ffffff;" value="&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;WebSocket Client (websocket-client library)&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Tick Parser: {timestamp, symbol, price, qty}&lt;br&gt;&amp;nbsp;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Data Validation &amp;amp; Cleaning&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Error Handling &amp;amp; Reconnection Logic&amp;nbsp;&amp;nbsp;&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="130" width="600" x="110" y="230" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-1" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="&lt;b&gt;STORAGE LAYER&lt;/b&gt;" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="400" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-2" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=#f0a30a;fontColor=#000000;strokeColor=#BD7000;" value="&lt;span style=&quot;background-color: transparent;&quot;&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; [SQLite Database: market_data.db]&amp;nbsp;&lt;br&gt;&lt;ul style=&quot;&quot;&gt;&lt;li style=&quot;&quot;&gt;Table: ticks (timestamp, symbol, price, qty)&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;&quot;&gt;Index: (symbol, timestamp) for fast queries&lt;br&gt;&lt;br&gt;&lt;br&gt;[In-Memory Buffer]&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;&quot;&gt;Pandas DataFrame for active processing&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;&quot;&gt;Size: Last 10,000 ticks per symbol&lt;/li&gt;&lt;/ul&gt;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;/span&gt;" vertex="1">
          <mxGeometry height="210" width="600" x="110" y="440" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-5" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.73" y="650" as="sourcePoint" />
            <mxPoint x="410.26" y="690" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-6" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="&lt;b&gt;SAMPLING ENGINE&lt;/b&gt;" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="690" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-7" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Time-based resampling: 1s / 1m / 5m&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;OHLCV aggregation:&lt;br&gt;&lt;br&gt;Open: first price in interval&lt;br&gt;&lt;br&gt;High: max price&lt;br&gt;&lt;br&gt;Low: min price&lt;br&gt;&lt;br&gt;Close: last price&lt;br&gt;&lt;br&gt;Volume: sum of quantities&lt;/font&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="210" width="600" x="110" y="730" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-8" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.71" y="940" as="sourcePoint" />
            <mxPoint x="410.23999999999995" y="980" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-9" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="ANALYTICS ENGINE" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="980" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-37" parent="1" style="shape=table;startSize=30;container=1;collapsible=0;childLayout=tableLayout;fillColor=#d5e8d4;gradientColor=#97d077;strokeColor=#82b366;" value="Core Modules " vertex="1">
          <mxGeometry height="310" width="600" x="110" y="1020" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-38" parent="BC-gbwZXl8G4IKcO2355-37" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" value="" vertex="1">
          <mxGeometry height="100" width="600" y="30" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-39" parent="BC-gbwZXl8G4IKcO2355-38" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;strokeColor=#2D7600;fontColor=#ffffff;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Regression&lt;/font&gt;&lt;div&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; OLS hedge ratio&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;statsmodels&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="100" width="300" as="geometry">
            <mxRectangle height="100" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-40" parent="BC-gbwZXl8G4IKcO2355-38" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Spread Analysis&lt;br&gt;&lt;/font&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Y - βX&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Rolling spread&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="100" width="300" x="300" as="geometry">
            <mxRectangle height="100" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-41" parent="BC-gbwZXl8G4IKcO2355-37" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" value="" vertex="1">
          <mxGeometry height="76" width="600" y="130" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-42" parent="BC-gbwZXl8G4IKcO2355-41" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&amp;nbsp;Stationarity&lt;/font&gt;&lt;div&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;ADF test&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;p-value check&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="76" width="300" as="geometry">
            <mxRectangle height="76" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-43" parent="BC-gbwZXl8G4IKcO2355-41" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Correlation&lt;/font&gt;&lt;div&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Rolling Pearson&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Window-based&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="76" width="300" x="300" as="geometry">
            <mxRectangle height="76" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-44" parent="BC-gbwZXl8G4IKcO2355-37" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;" value="" vertex="1">
          <mxGeometry height="104" width="600" y="206" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-45" parent="BC-gbwZXl8G4IKcO2355-44" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&amp;nbsp;Z-Score&lt;/font&gt;&lt;div&gt;&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Rolling mean&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Rolling std&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&amp;nbsp;Normalization&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="104" width="300" as="geometry">
            <mxRectangle height="104" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-46" parent="BC-gbwZXl8G4IKcO2355-44" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;overflow=hidden;top=0;left=0;bottom=0;right=0;pointerEvents=1;fillColor=#60a917;fontColor=#ffffff;strokeColor=#2D7600;" value="" vertex="1">
          <mxGeometry height="104" width="300" x="300" as="geometry">
            <mxRectangle height="104" width="300" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-47" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.33" y="1330" as="sourcePoint" />
            <mxPoint x="409.85999999999996" y="1370" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-48" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="ALERT SYSTEM" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="1370" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-49" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=light-dark(#CC0000,#83045E);strokeColor=#B20000;fontColor=#ffffff;" value="&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Rule Engine: IF z-score &amp;gt; threshold THEN alert&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Alert Types: Visual (UI), Console Log&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Configurable Thresholds&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="110" width="600" x="110" y="1410" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-50" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.67" y="1520" as="sourcePoint" />
            <mxPoint x="410.2" y="1560" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-51" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="STREAMLIT FRONTEND" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="1560" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-52" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=light-dark(#6A00FF,#6A00FF);strokeColor=#3700CC;fontColor=#ffffff;" value="&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;UI Components:&lt;br&gt;&lt;br&gt;Sidebar: Controls (symbols, timeframe, rolling window)&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Main Panel:&lt;br&gt;&lt;br&gt;- Database Content Viewer&lt;br&gt;- Price Comparison Chart (Plotly)&lt;br&gt;- Spread &amp;amp; Z-Score Chart&lt;br&gt;- Rolling Correlation Chart&lt;br&gt;- Summary Statistics&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Export: Download buttons (CSV)&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Status: Connection indicator, alerts&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="240" width="600" x="110" y="1600" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-53" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.74" y="1840" as="sourcePoint" />
            <mxPoint x="410.27" y="1880" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-54" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="USER" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="1880" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-55" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=light-dark(#6A00FF,#6A00FF);strokeColor=#3700CC;fontColor=#ffffff;" value="&lt;ul&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Traders monitoring pairs&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Researchers analyzing spreads&lt;br&gt;&lt;br&gt;&lt;/font&gt;&lt;/li&gt;&lt;li&gt;&lt;font style=&quot;color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;Risk managers tracking volatility&lt;/font&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="110" width="600" x="110" y="1920" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-56" edge="1" parent="1" style="shape=flexArrow;endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="409.6" y="2030" as="sourcePoint" />
            <mxPoint x="410.13" y="2070" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-57" parent="1" style="rounded=1;shadow=1;fontSize=12;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;" value="SUPPORTING SERVICES" vertex="1">
          <mxGeometry height="40" width="600" x="110" y="2070" as="geometry" />
        </mxCell>
        <mxCell id="BC-gbwZXl8G4IKcO2355-58" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;fillColor=light-dark(#6A00FF,#6A00FF);" value="&lt;ul&gt;&lt;li&gt;Logging: File + Console (analytics.log)&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;Error Handling: Try-catch with reconnection&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;Configuration: Hardcoded (extensible to config file)&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="110" width="600" x="110" y="2110" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
