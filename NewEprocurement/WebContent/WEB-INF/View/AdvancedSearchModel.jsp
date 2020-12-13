<div class="modal fade" id="myModal44" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                            <div class="modal-header">
                                <div class="img ">
                                    <img src="<c:url value="/resources/images/demo.png"/>" alt="contact_us">
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>

                            </div>

                            <div class="modal-body bg-gr ">
                                <div class="model-form">
								 			<div class="status-button modaladdvance">
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender" value="Live Tender" checked=""> Tender </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender"> Auction </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="Live Tender">RFX</label>
                        </div>
                     </div>
								<div class="row">
		
								<div class="form-group col-sm-6">
								<label>Tender Status</label>
								<select name="tender_status" class="select form-control" required="true">
								<option value="">Live Tender</option>
								 <option value="1">Archive</option>
								 <option value="2">Inprocess</option>
	                            </select>
								</div>
								<div class="form-group col-sm-6">
									<label>Tender Categories</label>
								<select name="categoriesOf_tender" class="select  form-control">
    <option value="-1">Tender Categories</option>
    <option value="1">Open</option>
    <option value="2">Restricted</option>
    <option value="3">Limited</option>


</select>
								</div>
								<div class="form-group col-sm-6">
									<label>Department</label>
								<select name="departmentNames"  class="select form-control">
    <option value="-1">Department</option>
    <option value="1">Indian Institute of Forest Management Bhopal</option>
    <option value="2">Institute of Hotel Management Catering Technology and Applied Nutrition Bhopal</option>
    <option value="3">Central Institute of Plastics Engineering and Technology Bhopal</option>
    <option value="4">DEMO DEPARTMENT</option>


</select>
								</div>
								<div class="form-group col-sm-6">
									<label>Tender No.</label>
								<input name="" type="text"  class="form-control" placeholder="Tender No"/>
								</div>
								<div class="form-group col-sm-6">
									<label>NIT No.</label>
								<input name="" type="text"  class="form-control" placeholder="NIT No"/>
								</div>
								<div class="form-group col-sm-6">
									<label>Keyword</label>
								<select name="keyword" class="select form-control" placeholder="Keyword">
    <option value="-1">Select KeyWord</option>
    <option value="112">Abrasives</option>
    <option value="63">Agro Products</option>
    <option value="36">Air Conditioners</option>
    <option value="141">Air Transport</option>
    <option value="37">Alternators</option>
    <option value="100">Aluminium</option>
    <option value="64">Animal and Animal Feeds</option>
    <option value="185">Anti Termite</option>
    <option value="8">Architect  Interior Designer</option>
    <option value="132">Automobiles Ancillaries</option>
    <option value="1">Aviation Equipment</option>
    <option value="93">Ball Bearings</option>
    <option value="9">Ballast</option>
    <option value="59">Banking and Mutual Funds and Leasings</option>
    <option value="65">Beer  Soft Drinks  Liquors</option>
    <option value="38">Boiler and Heater</option>
    <option value="155">Boundary Wall</option>
    <option value="10">Bridges</option>
    <option value="11">Building Material</option>
    <option value="60">Business Consultancy</option>
    <option value="12">Canal Irrigation Work</option>
    <option value="75">Casting Structurals Fabrications</option>
    <option value="13">Ceiling Flooring Plaster</option>
    <option value="113">Cement</option>
    <option value="114">Cement and Asbestos Products</option>
    <option value="115">Ceramic tiles and Articles</option>
    <option value="94">Chemical Machinery</option>
    <option value="2">Chemicals</option>
    <option value="162">Chicken</option>
    <option value="14">Civil Works</option>
    <option value="189">Class Room Chairs</option>
    <option value="179">Cleaning</option>
    <option value="87">Coal and Lignite</option>
    <option value="175">Cold Room</option>
    <option value="133">Commercial Vehicles</option>
    <option value="50">Computer Hardwares and Consumables</option>
    <option value="51">Computer Softwares</option>
    <option value="156">Concrete Road</option>
    <option value="39">Conductors and Inductors</option>
    <option value="7">Courier Services</option>
    <option value="88">Crude Oil  Natural Gas  Mineral Fuels</option>
    <option value="151">DG Set</option>
    <option value="173">DISHWASHER</option>
    <option value="66">Dairy Products</option>
    <option value="15">Dam Work</option>
    <option value="16">Desilting</option>
    <option value="180">Distempering</option>
    <option value="17">Drainage</option>
    <option value="18">Drilling</option>
    <option value="3">Drugs and Pharmaceuticals</option>
    <option value="165">Egg</option>
    <option value="35">Electrical</option>
    <option value="49">Electronics</option>
    <option value="19">Enviromental Work</option>
    <option value="20">Excavation</option>
    <option value="57">Fabrication</option>
    <option value="186">False ceiling</option>
    <option value="40">Fan</option>
    <option value="76">Fasteners</option>
    <option value="21">Fencing Wall Work</option>
    <option value="4">Fertilizers and pesticides</option>
    <option value="58">Financial Services</option>
    <option value="159">Fire Extinguisher</option>
    <option value="164">Fish</option>
    <option value="158">Floppy Disk</option>
    <option value="67">Food Grains</option>
    <option value="68">Food Processing</option>
    <option value="62">Food Products</option>
    <option value="83">Footwear and Leather Products</option>
    <option value="69">Forest Departments</option>
    <option value="184">Furnishing</option>
    <option value="153">Furniture</option>
    <option value="178">Gardening</option>
    <option value="168">Gas Serviceing</option>
    <option value="116">Gems and Jewellery</option>
    <option value="41">Generators</option>
    <option value="117">Glass and Glassware</option>
    <option value="160">Grocery</option>
    <option value="171">Hardware Item</option>
    <option value="103">Health Services Equipments</option>
    <option value="177">Horticulture</option>
    <option value="104">Hotels and Restaurants</option>
    <option value="22">House  Building</option>
    <option value="148">House Keeping</option>
    <option value="176">Housekeeping Equipment</option>
    <option value="5">Industrial Gases</option>
    <option value="42">Insulator</option>
    <option value="61">Insurance Services</option>
    <option value="77">Iron</option>
    <option value="74">Iron and Steel</option>
    <option value="167">Kitchen Tool Kit</option>
    <option value="81">Lab Equipments</option>
    <option value="105">Labour And Manpower</option>
    <option value="161">Laundry</option>
    <option value="82">Leather Products</option>
    <option value="43">Lift</option>
    <option value="44">Light and Bulbs</option>
    <option value="95">Machine Tools</option>
    <option value="84">Magnetic Equipments</option>
    <option value="166">Masale</option>
    <option value="85">Material Handling</option>
    <option value="150">Mess</option>
    <option value="78">Metal Tubes and Pipes</option>
    <option value="45">Meters</option>
    <option value="89">Minerals</option>
    <option value="90">Mining Equipments</option>
    <option value="86">Mining and Quarrying</option>
    <option value="181">Mosquito Proof Window Shutter</option>
    <option value="163">Mutton</option>
    <option value="125">Non Conventional Energy</option>
    <option value="99">Non-Ferrous Metals</option>
    <option value="92">Non-electrical Machinery</option>
    <option value="102">Non-financial Services</option>
    <option value="111">Non-metallic Mineral Product</option>
    <option value="52">Office Automation</option>
    <option value="46">Other Electrical Products</option>
    <option value="96">Other Machinery</option>
    <option value="79">Other Metal Products</option>
    <option value="118">Other Non Metallic Mineral</option>
    <option value="101">Other Non-Ferrous Metals</option>
    <option value="134">Other Transport Equipments</option>
    <option value="188">PVC flooring</option>
    <option value="23">Painting</option>
    <option value="6">Paints and Varnishes</option>
    <option value="53">Panel distribution Board connector</option>
    <option value="145">Paper and Paper Products</option>
    <option value="183">Parking Shed</option>
    <option value="135">Passenger Cars and Jeeps</option>
    <option value="157">Pen Drive</option>
    <option value="91">Petroleum Products</option>
    <option value="97">Pharma machinery</option>
    <option value="24">Pipeline Project</option>
    <option value="121">Plastic</option>
    <option value="122">Plastic Product and Granules</option>
    <option value="123">Plastic Tubes and Pipes</option>
    <option value="25">Platform Jetty RCC Work</option>
    <option value="26">Plumbing Sanitary Work</option>
    <option value="182">Power Cable</option>
    <option value="124">Power Plant</option>
    <option value="126">Power Plant</option>
    <option value="98">Prime Movers</option>
    <option value="146">Printing</option>
    <option value="191">Public Address System(PA)</option>
    <option value="47">Pumps and Motor and Compressors</option>
    <option value="136">Railway Ancillaries</option>
    <option value="142">Railways Transport Services</option>
    <option value="106">Real Estate Services</option>
    <option value="107">Recreational Services</option>
    <option value="119">Refractories</option>
    <option value="48">Refrigerator</option>
    <option value="190">Replacement Street Light Cable</option>
    <option value="143">Road Transport Services</option>
    <option value="27">Roads</option>
    <option value="127">Rubber Products</option>
    <option value="128">Rubber and Rubber Products</option>
    <option value="28">Safety Equipment\Explosives</option>
    <option value="172">Sanitary Items</option>
    <option value="54">Scientific Instruments</option>
    <option value="108">Security Services</option>
    <option value="29">Shed Construction</option>
    <option value="137">Shipping</option>
    <option value="30">Soil Survey</option>
    <option value="80">Stainless Steel</option>
    <option value="120">Stones - Granite - Earth</option>
    <option value="109">Storage and Warehousing</option>
    <option value="70">Sugar</option>
    <option value="55">Switch gear switching Apparatus</option>
    <option value="56">Telecommunication Services</option>
    <option value="129">Textiles</option>
    <option value="130">Textiles Product</option>
    <option value="170">Tin Items</option>
    <option value="71">Tobacco Products</option>
    <option value="110">Tourism</option>
    <option value="131">Transport Equipments</option>
    <option value="140">Transport Services</option>
    <option value="31">Trenching and Dredging</option>
    <option value="138">Two and Three Wheelers</option>
    <option value="139">Tyres and Tubes</option>
    <option value="72">Vegetable  Fruit  Flower  Plants</option>
    <option value="73">Vegetable Oils and Starches</option>
    <option value="169">Vegetable and Fruits</option>
    <option value="174">WALK IN CHILLER</option>
    <option value="187">Wall Paneling</option>
    <option value="154">Water Cooler</option>
    <option value="32">Water Purification</option>
    <option value="33">Water Storage and Supply</option>
    <option value="144">Wood Paper and Paper Products</option>
    <option value="147">Woods and Furniture</option>
    <option value="34">Zone Contract</option>
    <option value="149">cooling System</option>
    <option value="152">organic west convertrer</option>


</select>
								</div>
								<div class="form-group col-sm-6">
									<label>Contractor Class</label>
								<select name="contclass"  class="select form-control">
    <option value="-1">Contractor Class</option>
    <option value="1">Class A</option>
    <option value="2">Class B</option>
    <option value="3">Class C</option>
    <option value="4">Open</option>


</select>
								</div>
								<div class="form-group col-sm-6">
									<label>Area of Work</label>
								<select name="TypesOfArea"   class="select form-control">
    <option value="-1">Area of Work</option>
    <option value="1">Civil</option>
    <option value="2">Electrical</option>
    <option value="3">Mechanical</option>
    <option value="4">Civil &amp; Electrical</option>
    <option value="5">Open</option>


</select>
								</div>
								<div class=" col-sm-12">
									<label class="contractorLogin">Probable Amount of Contract (P.A.C)</label>
									</div>
									<div class="form-group col-sm-6">
									<label>To</label>
								<input name="" type="text"  class="form-control" placeholder="To Date"/>
								</div>
								<div class="form-group col-sm-6">
									<label>From</label>
								<input name="" type="text"  class="form-control" placeholder="From Date"/>
								</div>
								<div class="form-group col-sm-6">
									<label>Start Date of Purchase</label>
								<input name="" type="text"  class="form-control" placeholder="Start Date of Purchase"/>
								</div>
								<div class="form-group col-sm-6">
									<label>Last Date of Purchase</label>
								<input name="" type="text"  class="form-control" placeholder="Last Date of Purchase"/>
								</div>
						</div>
					<div class="pull-right">	
                     <button type="button" class="btn btn-success" onclick="getAdvanceSearch()">Search</button>
                     <button type="button" class="btn btn-warning">Reset</button>
                     <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					 </div>
 						<!--close row-->

                                </div>
                            </div>
                        </div>

            </div>
        </div>