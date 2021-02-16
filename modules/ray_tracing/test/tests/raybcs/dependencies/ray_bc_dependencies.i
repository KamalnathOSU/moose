[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 1
  []
[]

[UserObjects/study]
  type = RepeatableRayStudy
  start_points = '0 0 0'
  directions = '1 0 0'
  names = ray
  ray_data_names = data
  initial_ray_data = 1
  ray_kernel_coverage_check = false
[]

[RayBCs]
  [add_1]
    type = ChangeDataRayBCTest
    boundary = right
    data_name = data
    add_value = 1
    depends_on = add_10
  []
  [scale_5]
    type = ChangeDataRayBCTest
    data_name = data
    boundary = right
    scale_value = 5
    depends_on = scale_9
  []
  [add_10]
    type = ChangeDataRayBCTest
    data_name = data
    boundary = right
    add_value = 10
  []
  [scale_9]
    type = ChangeDataRayBCTest
    data_name = data
    boundary = right
    scale_value = 9
    depends_on = add_1
  []
  [kill]
    type = KillRayBC
    boundary = right
  []
[]

[Postprocessors/value]
  type = RayDataValue
  study = study
  ray_name = ray
  data_name = data
[]

[Problem]
  solve = false
[]

[Executioner]
  type = Steady
[]

[Outputs]
  csv = true
[]
