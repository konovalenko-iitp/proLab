import colour
import numpy as np
from scipy.io import loadmat
from scipy.io import savemat

request = loadmat('../python/request.mat')
XYZ = request['XYZ']
reference_illuminant  = loadmat('../python/reference_illuminant.mat')
XYZ_w = reference_illuminant['ref_ill']
L_A = 0.20
Y_b = 0.20
surround = colour.CAM16_VIEWING_CONDITIONS['Average']
CAM16 = colour.XYZ_to_CAM16(XYZ, XYZ_w, L_A, Y_b, surround)
JMh = np.array([CAM16.J, CAM16.M, CAM16.h])
JMh = JMh.transpose()
CAM16UCS = colour.JMh_CAM16_to_CAM16UCS(JMh)
mdict={'CAM16UCS': CAM16UCS}
savemat('../python/response.mat', mdict)