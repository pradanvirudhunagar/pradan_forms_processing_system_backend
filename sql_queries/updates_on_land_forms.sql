const updateQuery = `
  UPDATE forms
  LEFT JOIN bank_details ON forms.id = bank_details.form_id
  LEFT JOIN files ON forms.id = files.form_id
  LEFT JOIN form_lands ON forms.id = form_lands.form_id
  SET  
    forms.farmer_name = ?, 
    forms.age = ?, 
    forms.mobile = ?, 
    forms.district = ?, 
    forms.block = ?, 
    forms.panchayat = ?, 
    forms.hamlet = ?, 
    forms.id_type = ?, 
    forms.id_number = ?, 
    forms.gender = ?, 
    forms.spouse = ?, 
    forms.type_of_households = ?, 
    forms.h_members = ?, 
    forms.hh_occupation = ?, 
    forms.special_catog = ?, 
    forms.caste = ?, 
    forms.house_owner = ?, 
    forms.type_of_house = ?, 
    forms.drinking_water = ?, 
    forms.potability = ?, 
    forms.domestic_water = ?, 
    forms.toilet_avail = ?, 
    forms.toilet_cond = ?, 
    forms.household_education = ?, 
    forms.lat = ?, 
    forms.lon = ?,

    bank_details.account_holder_name = ?, 
    bank_details.account_number = ?, 
    bank_details.bank_name = ?, 
    bank_details.branch = ?, 
    bank_details.ifsc_code = ?, 
    bank_details.farmer_ack = ?, 

    files.identity= ?, 
    files.geotag = ?, 
    files.patta = ?, 
    files.fmb = ?, 
    files.photo = ?, 
    files.passbook = ?,

    form_lands.ownership = ?, 
    form_lands.well_irrigation = ?, 
    form_lands.area_irrigated = ?, 
    form_lands.irrigated_lands = ?, 
    form_lands.patta = ?, 
    form_lands.total_area = ?, 
    form_lands.taluk = ?, 
    form_lands.firka = ?, 
    form_lands.revenue = ?, 
    form_lands.crop_season = ?, 
    form_lands.livestocks = ?, 
    form_lands.sf_number = ?, 
    form_lands.soil_type = ?, 
    form_lands.land_to_benefit = ?, 
    form_lands.date_of_ins = ?, 
    form_lands.area_benefited = ?, 
    form_lands.type_of_work = ?, 
    form_lands.any_other_works = ?, 
    form_lands.p_contribution = ?, 
    form_lands.f_contribution = ?, 
    form_lands.total_est = ?


  WHERE 
    forms.form_type = 1
    AND forms.id = ?;
`;
