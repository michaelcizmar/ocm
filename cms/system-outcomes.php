<?php

/***********************************/
/* Pika CMS (C) 2015 Pika Software */
/* http://pikasoftware.com         */
/***********************************/

require_once('pika-danio.php');
pika_init();
require_once('plFlexList.php');
require_once('pikaTempLib.php');
require_once('pikaMenu.php');


$base_url = pl_settings_get('base_url');
$main_html = array();

if (!pika_authorize("system", array()))
{
	$main_html['content'] = "Access denied";
	$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
						 <a href=\"{$base_url}site_map.php\">Site Map</a> &gt;
						 Menus";
	
	$default_template = new pikaTempLib('templates/default.html',$main_html);
	$buffer = $default_template->draw();
	pika_exit($buffer);
}

$action = pl_grab_get('action');
$outcome = pl_grab_get('outcome');
$value = pl_grab_get('value');
$old_value = pl_grab_get('old_value');
$menu_name = pl_grab_get('menu_name');
$field_list = pl_grab_get('field_list');

$numeric_types = array('tinyint','smallint','mediumint','int','bigint',
								'decimal','float','double','real',
								'bit','bool','serial');

$menu_yes_no = pikaTempLib::getMenu('yes_no');
$menu_enable_disable = array('0' => 'Enable', '' => 'Enable', '1' => 'Disable');

switch ($action)
{
	case 'edit_menu':
		$a = array();
		$menu_listing = new plFlexList();
		$menu_listing->template_file = 'subtemplates/system-menus.html';
		$result = pikaMenu::getMenuDB($menu_name);
		$a['menu_name'] = $menu_name;
		
		while ($row = mysql_fetch_assoc($result)) 
		{
			$row['menu_name'] = $menu_name;
			$menu_listing->addRow($row);
		}
		
		$a['menu_list'] = $menu_listing->draw();
		
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
							 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
							 <a href=\"{$base_url}/system-menus.php\">Menus</a> &gt;
							 Editing {$menu_name}";
		$template = new pikaTempLib('subtemplates/system-menus.html',$a,'edit');
		$main_html['content'] = $template->draw();

		break;
	case 'edit':
	
		$outcome = mysql_real_escape_string($outcome);
		$main_html['content'] = "<textarea rows=\"18\" class=\"input-xxlarge\">";
		$sql = "SELECT * FROM outcome_goals WHERE outcome_problem ";
		$sql .= " = '{$outcome}' ORDER BY outcome_goal_order ASC";
		$result = mysql_query($sql);
		
		while ($row = mysql_fetch_assoc($result)) 
		{
			$main_html['content'] .= "{$row['outcome_name']}\n";
		}
		
		$main_html['content'] .= "</textarea>\n";
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
							 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
							 <a href=\"{$base_url}/system-menus.php\">Menus</a> &gt;
							 Editing {$menu_name}";
		break;
		
	case 'edit_item':
		$a = array();
		$menu_item = new pikaMenu($menu_name,$value);
		$db_table_array = $menu_item->getTableColumns();
		
		$a = $menu_item->getValues();
		$a['value_db_type'] = strtoupper($db_table_array['value']['Type']);
		$a['value_db_size'] = $db_table_array['value']['Length'];
		
		$a['value_input'] = pikaTempLib::plugin('input_text','value',$a['value'],array(),array("size={$db_table_array['value']['Length']}","maxlength={$db_table_array['value']['Length']}"));
		$a['old_value'] = $a['value'];
		$a['menu_name'] = $menu_name;
		$a['label'] = pikaTempLib::plugin('input_text','label',$a['label'],'',array("size={$db_table_array['label']['Length']}","maxlength={$db_table_array['label']['Length']}"));	
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
							 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
							 <a href=\"{$base_url}/system-menus.php\">Menus</a> &gt;
							 Editing {$menu_name}";
		$template = new pikaTempLib('subtemplates/system-menus.html',$a,'edit_item');
		$main_html['content'] = $template->draw();

		break;
	
	case 'update':
		$label = pl_grab_get('label');
		$menu = new pikaMenu($menu_name,$old_value);
		$menu->value = $value;
		$menu->label = $label;
		$menu->save();
		header("Location: {$base_url}/system-menus.php?action=edit_menu&menu_name={$menu_name}");
		break;
	case 'update_classic':
		$values = pl_grab_post('values');
		$values_array = explode("\n",$values);
		$temp_menu = array();
		foreach ($values_array as $menu_item) {
			$menu_parts = explode("|",$menu_item);
			if(count($menu_parts) < 2 && strpos($menu_item,'\t') !== false) 
			{
				$menu_parts = explode('\t',$menu_item);
			}
			$value = trim($menu_parts[0]);
			$label = $value;
			if(isset($menu_parts[1]) && $menu_parts[1]) 
			{
				$label = trim($menu_parts[1]);
			}
			$temp_menu[$value] = $label;
		}
		pikaMenu::setMenu($menu_name,$temp_menu);
		header("Location: {$base_url}/system-menus.php?action=edit_menu&menu_name={$menu_name}");
		break;
	case 'confirm_delete':
		$a = array();
		$menu_item = new pikaMenu($menu_name,$value);
		
		$a['value'] = $value;
		$a['label'] = $menu_item->label;
		$a['menu_name'] = $menu_name;
		
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
							 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
							 <a href=\"{$base_url}/system-menus.php\">Menus</a> &gt;
							 Confirm Delete";
		$template = new pikaTempLib('subtemplates/system-menus.html',$a,'confirm_delete');
		$main_html['content'] = $template->draw();
		break;
	case 'delete':
		$cancel = pl_grab_get('cancel');
		if(!$cancel)
		{
			$menu_item = new pikaMenu($menu_name,$value);
			$menu_item->delete();
			pikaMenu::resetMenuOrder($menu_name);
		}
		header("Location: {$base_url}/system-menus.php?action=edit_menu&menu_name={$menu_name}");
		break;
	case 'move_up':
		$menu = new pikaMenu($menu_name,$value);
		$menu->moveUp();
		header("Location: {$base_url}/system-menus.php?action=edit_menu&menu_name={$menu_name}");
		break;
	case 'move_down':
		$menu = new pikaMenu($menu_name,$value);
		$menu->moveDown();
		header("Location: {$base_url}/system-menus.php?action=edit_menu&menu_name={$menu_name}");
		break;
	default:
	
		$main_html['content'] .= "<h2>Please select a Problem Code category to edit</h2><div class=\"span4\">";
		
		for ($i = 0; $i < 10; $i++)
		{
			$main_html['content'] .= "<a class=\"btn btn-block\" href=\"{$base_url}/system-outcomes.php?action=edit&outcome={$i}X\">{$i}0's</a><br>\n";
		}
		
		$problem_codes = pl_menu_get('problem');
		
		foreach ($problem_codes as $key => $value)
		{
			$main_html['content'] .= "<a class=\"btn btn-block\" href=\"{$base_url}/system-outcomes.php?action=edit&outcome={$key}\">{$value}</a><br>\n";
		}

		$main_html['content'] .= "</div>";
		
		$main_html['nav'] = "<a href=\"{$base_url}\">Pika Home</a> &gt;
							 <a href=\"{$base_url}/site_map.php\">Site Map</a> &gt;
							 Menus";
		
		break;
}

$main_html['page_title'] = 'Outcomes Editor';
$default_template = new pikaTempLib('templates/default.html',$main_html);
$buffer = $default_template->draw();
pika_exit($buffer);

?>