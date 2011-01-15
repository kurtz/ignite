
        <nav>
          <?php  echo $view->getmenu(); ?>
        </nav>
        <header style="position: relative">
           	<a href="index.php?option=com_tuiyo"><img style="margin: 10px 20px"src="<?php echo $iconPath ?>/images/logo2.png"  /></a>
			<div class="reporter" style="position:absolute; top: 10px; left: 130px"><jdoc:include type="message" /></div>
            <div>
                <ul id="tabs">
					<?php $i=0;  $active=false; $act = JRequest::getVar("action", null); $tablists = (isset($view->tabgroups[$view->tabgroup])) ?$view->tabgroups[$view->tabgroup]:$view->tabgroups['_default'];
						foreach($tablists as $tab=>$href){ 
							parse_str($href);
							if(isset($action)&&(string)$action===(string)$act){
								$active = true;
							}elseif(empty($act)&&$i<1){
								$active = true;
							}
							?><li><a href="<?php echo $href ?>" <?php if($active)  : echo 'class="active"'; endif; 	?> ><?php echo $tab ?></a></li> <?php 
					 $i++; $active=false;}
					?>
                </ul>
                <ul id="search">
                    <li><form id="searchForm" class="TuiyoForm"><input type="text" name="search" style="padding: 7px;width: 230px;"placeholder="search" /></form></li>
                </ul>
            </div>
        </header>
        <div id="main">
            <section id="sidebar">
                <div class="section">
                    <h3>System Mode</h3>
                    <p>Put your website in development mode (offline) for maintainance</p>
					<h3>Members Online</h3>
					<p>There are currently no members online</p>
                </div>                                             
            </section>
            <section id="page">
				<?php echo $adminPage ?>
            </section>
        </div>
        <footer>
			<p>&copy; 2006, 2007, 2008, 2009, 2010, 2011 <a href="http://www.drstonyhills.com/">dr.stonyhills</a> and Powered by Joomla</p>
            <p><?php echo $version ?> Licensed as GPLv2.1 </p>
        </footer>
