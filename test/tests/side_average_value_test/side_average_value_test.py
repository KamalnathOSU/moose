import tools

def test(dofs=0, np=0):
  tools.executeAppAndDiff(__file__,'side_average_value_test.i',['out.e'], dofs, np)
