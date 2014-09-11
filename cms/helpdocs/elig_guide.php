<?php 

chdir('../');
require_once ('pika_cms.php'); 

$elig = pl_table_array('poverty');
?>

<html>
<body>

<table border="0" cellpadding="5">
<tr>
        
    <th>
         Family Size
    </th>
                
    <th>
	Income
    </th>
                
</tr>

        
        
<tr bgcolor="#CCCCCC">
            
                 
    <td align="right">1</td>
    <td align="right">$<?php echo $elig['1']; ?></td>
</tr>
            
<tr bgcolor="#DDDDDD">
            
                
    <td align="right">2</td>
    <td align="right">$<?php echo $elig['2']; ?></td>
</tr>
            
<tr bgcolor="#CCCCCC">
            
                 
    <td align="right">3</td>
    <td align="right">$<?php echo $elig['3']; ?></td>
</tr>
            
<tr bgcolor="#DDDDDD">
            
                 
    <td align="right">4</td>
    <td align="right">$<?php echo $elig['4']; ?></td>
</tr>
            
<tr bgcolor="#CCCCCC">
            
                 
    <td align="right">5</td>
    <td align="right">$<?php echo $elig['5']; ?></td>
</tr>
            
<tr bgcolor="#DDDDDD">
            
                 
    <td align="right">6</td>
    <td align="right">$<?php echo $elig['6']; ?></td>
</tr>
            
<tr bgcolor="#CCCCCC">
            
                
    <td align="right">7</td>
    <td align="right">$<?php echo $elig['7']; ?></td>
</tr>
            
<tr bgcolor="#DDDDDD">
            
                 
    <td align="right">8</td>
    <td align="right">$<?php echo $elig['8']; ?></td>
</tr>
            
</table>

$<?php echo $elig['0']; ?> for every additional family member beyond 8
</body>
</html>
