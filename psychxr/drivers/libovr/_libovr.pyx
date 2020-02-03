# distutils: language=c++
#  =============================================================================
#  Python Interface Module for LibOVR
#  =============================================================================
#
#  _libovr.pyx
#
#  Copyright 2019 Matthew Cutone <cutonem(a)yorku.ca> and Laurie M. Wilcox
#  <lmwilcox(a)yorku.ca>; The Centre For Vision Research, York University,
#  Toronto, Canada
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
#
"""This extension module exposes the LibOVR API to Python using the official,
proprietary Oculus PC SDK.

This extension module makes use of the official Oculus PC SDK. A C/C++ interface
for tracking, rendering, and VR math for Oculus products. The Oculus PC SDK is
Copyright (c) Facebook Technologies, LLC and its affiliates. All rights
reserved. You must accept the 'EULA', 'Terms of Use' and 'Privacy Policy'
associated with the Oculus PC SDK to use this module in your software (which you
did when you downloaded the SDK to build this module, didn't ya?), if not see
https://www.oculus.com/legal/terms-of-service/ to access those documents.

"""
# ------------------------------------------------------------------------------
# Module information
#
__author__ = "Matthew D. Cutone"
__credits__ = ["Laurie M. Wilcox"]
__copyright__ = "Copyright 2019 Matthew D. Cutone"
__license__ = "MIT"
__version__ = "0.2.4"
__status__ = "Stable"
__maintainer__ = "Matthew D. Cutone"
__email__ = "cutonem@yorku.ca"

# ------------------------------------------------------------------------------
# Exported objects
#
__all__ = [
    'SUCCESS',
    'SUCCESS_NOT_VISIBLE',
    'SUCCESS_DEVICE_UNAVAILABLE',
    'SUCCESS_BOUNDARY_INVALID',
    'ERROR_MEMORY_ALLOCATION_FAILURE',
    'ERROR_INVALID_SESSION',
    'ERROR_TIMEOUT',
    'ERROR_NOT_INITIALIZED',
    'ERROR_INVALID_PARAMETER',
    'ERROR_SERVICE_ERROR',
    'ERROR_NO_HMD',
    'ERROR_UNSUPPORTED',
    'ERROR_DEVICE_UNAVAILABLE',
    'ERROR_INVALID_HEADSET_ORIENTATION',
    'ERROR_CLIENT_SKIPPED_DESTROY',
    'ERROR_CLIENT_SKIPPED_SHUTDOWN',
    'ERROR_SERVICE_DEADLOCK_DETECTED',
    'ERROR_INSUFFICENT_ARRAY_SIZE',
    'ERROR_NO_EXTERNAL_CAMERA_INFO',
    'ERROR_LOST_TRACKING',
    'ERROR_EXTERNAL_CAMERA_INITIALIZED_FAILED',
    'ERROR_EXTERNAL_CAMERA_CAPTURE_FAILED',
    'ERROR_EXTERNAL_CAMERA_NAME_LISTS_BUFFER_SIZE',
    'ERROR_EXTERNAL_CAMERA_NAME_LISTS_MISMATCH',
    'ERROR_EXTERNAL_CAMERA_NOT_CALIBRATED',
    'ERROR_EXTERNAL_CAMERA_NAME_WRONG_SIZE',
    'ERROR_AUDIO_DEVICE_NOT_FOUND',
    'ERROR_AUDIO_COM_ERROR',
    'ERROR_INITIALIZE',
    'ERROR_LIB_LOAD',
    'ERROR_SERVICE_CONNECTION',
    'ERROR_SERVICE_VERSION',
    'ERROR_INCOMPATIBLE_OS',
    'ERROR_DISPLAY_INIT',
    'ERROR_SERVER_START',
    'ERROR_REINITIALIZATION',
    'ERROR_MISMATCHED_ADAPTERS',
    'ERROR_LEAKING_RESOURCES',
    'ERROR_CLIENT_VERSION',
    'ERROR_OUT_OF_DATE_OS',
    'ERROR_OUT_OF_DATE_GFX_DRIVER',
    'ERROR_INCOMPATIBLE_OS',
    'ERROR_NO_VALID_VR_DISPLAY_SYSTEM',
    'ERROR_OBSOLETE',
    'ERROR_DISABLED_OR_DEFAULT_ADAPTER',
    'ERROR_HYBRID_GRAPHICS_NOT_SUPPORTED',
    'ERROR_DISPLAY_MANAGER_INIT',
    'ERROR_TRACKER_DRIVER_INIT',
    'ERROR_LIB_SIGN_CHECK',
    'ERROR_LIB_PATH',
    'ERROR_LIB_SYMBOLS',
    'ERROR_REMOTE_SESSION',
    'ERROR_INITIALIZE_VULKAN',
    'ERROR_BLACKLISTED_GFX_DRIVER',
    'ERROR_DISPLAY_LOST',
    'ERROR_TEXTURE_SWAP_CHAIN_FULL',
    'ERROR_TEXTURE_SWAP_CHAIN_INVALID',
    'ERROR_GRAPHICS_DEVICE_RESET',
    'ERROR_DISPLAY_REMOVED',
    'ERROR_CONTENT_PROTECTION_NOT_AVAILABLE',
    'ERROR_APPLICATION_VISIBLE',
    'ERROR_DISALLOWED',
    'ERROR_DISPLAY_PLUGGED_INCORRECTY',
    'ERROR_DISPLAY_LIMIT_REACHED',
    'ERROR_RUNTIME_EXCEPTION',
    'ERROR_NO_CALIBRATION',
    'ERROR_OLD_VERSION',
    'ERROR_MISFORMATTED_BLOCK',
    'EYE_LEFT',
    'EYE_RIGHT',
    'EYE_COUNT',
    'HAND_LEFT',
    'HAND_RIGHT',
    'HAND_COUNT',
    'KEY_USER',
    'KEY_NAME',
    'KEY_GENDER',
    'DEFAULT_GENDER',
    'KEY_PLAYER_HEIGHT',
    'DEFAULT_PLAYER_HEIGHT',
    'KEY_EYE_HEIGHT',
    'DEFAULT_EYE_HEIGHT',
    'KEY_NECK_TO_EYE_DISTANCE',
    'DEFAULT_NECK_TO_EYE_HORIZONTAL',
    'DEFAULT_NECK_TO_EYE_VERTICAL',
    'KEY_EYE_TO_NOSE_DISTANCE',
    'DEBUG_HUD_STEREO_MODE',
    'DEBUG_HUD_STEREO_GUIDE_INFO_ENABLE',
    'DEBUG_HUD_STEREO_GUIDE_SIZE',
    'DEBUG_HUD_STEREO_GUIDE_POSITION',
    'DEBUG_HUD_STEREO_GUIDE_YAWPITCHROLL',
    'DEBUG_HUD_STEREO_GUIDE_COLOR',
    'CONTROLLER_TYPE_XBOX',
    'CONTROLLER_TYPE_REMOTE',
    'CONTROLLER_TYPE_TOUCH',
    'CONTROLLER_TYPE_LTOUCH',
    'CONTROLLER_TYPE_RTOUCH',
    'CONTROLLER_TYPE_OBJECT0',
    'CONTROLLER_TYPE_OBJECT1',
    'CONTROLLER_TYPE_OBJECT2',
    'CONTROLLER_TYPE_OBJECT3',
    'BUTTON_A',
    'BUTTON_B',
    'BUTTON_RTHUMB',
    'BUTTON_RSHOULDER',
    'BUTTON_X',
    'BUTTON_Y',
    'BUTTON_LTHUMB',
    'BUTTON_LSHOULDER',
    'BUTTON_UP',
    'BUTTON_DOWN',
    'BUTTON_LEFT',
    'BUTTON_RIGHT',
    'BUTTON_ENTER',
    'BUTTON_BACK',
    'BUTTON_VOLUP',
    'BUTTON_VOLDOWN',
    'BUTTON_HOME',
    'BUTTON_PRIVATE',
    'BUTTON_RMASK',
    'BUTTON_LMASK',
    'TOUCH_A',
    'TOUCH_B',
    'TOUCH_RTHUMB',
    'TOUCH_RTHUMBREST',
    'TOUCH_X',
    'TOUCH_Y',
    'TOUCH_LTHUMB',
    'TOUCH_LTHUMBREST',
    'TOUCH_LINDEXTRIGGER',
    'TOUCH_RINDEXPOINTING',
    'TOUCH_RTHUMBUP',
    'TOUCH_LINDEXPOINTING',
    'TOUCH_LTHUMBUP',
    'TEXTURE_SWAP_CHAIN0',
    'TEXTURE_SWAP_CHAIN1',
    'TEXTURE_SWAP_CHAIN2',
    'TEXTURE_SWAP_CHAIN3',
    'TEXTURE_SWAP_CHAIN4',
    'TEXTURE_SWAP_CHAIN5',
    'TEXTURE_SWAP_CHAIN6',
    'TEXTURE_SWAP_CHAIN7',
    'TEXTURE_SWAP_CHAIN8',
    'TEXTURE_SWAP_CHAIN9',
    'TEXTURE_SWAP_CHAIN10',
    'TEXTURE_SWAP_CHAIN11',
    'TEXTURE_SWAP_CHAIN12',
    'TEXTURE_SWAP_CHAIN13',
    'TEXTURE_SWAP_CHAIN14',
    'TEXTURE_SWAP_CHAIN15',
    'TEXTURE_SWAP_CHAIN_COUNT',
    'FORMAT_R8G8B8A8_UNORM',
    'FORMAT_R8G8B8A8_UNORM_SRGB',
    'FORMAT_R16G16B16A16_FLOAT',
    'FORMAT_R11G11B10_FLOAT',
    'FORMAT_D16_UNORM',
    'FORMAT_D24_UNORM_S8_UINT',
    'FORMAT_D32_FLOAT',
    'MAX_PROVIDED_FRAME_STATS',
    'TRACKED_DEVICE_TYPE_HMD',
    'TRACKED_DEVICE_TYPE_LTOUCH',
    'TRACKED_DEVICE_TYPE_RTOUCH',
    'TRACKED_DEVICE_TYPE_TOUCH',
    'TRACKED_DEVICE_TYPE_OBJECT0',
    'TRACKED_DEVICE_TYPE_OBJECT1',
    'TRACKED_DEVICE_TYPE_OBJECT2',
    'TRACKED_DEVICE_TYPE_OBJECT3',
    'TRACKING_ORIGIN_EYE_LEVEL',
    'TRACKING_ORIGIN_FLOOR_LEVEL',
    'PRODUCT_VERSION',
    'MAJOR_VERSION',
    'MINOR_VERSION',
    'PATCH_VERSION',
    'BUILD_NUMBER',
    'DLL_COMPATIBLE_VERSION',
    'MIN_REQUESTABLE_MINOR_VERSION',
    'FEATURE_VERSION',
    'STATUS_ORIENTATION_TRACKED',
    'STATUS_POSITION_TRACKED',
    'STATUS_ORIENTATION_VALID',
    'STATUS_POSITION_VALID',
    'PERF_HUD_MODE',
    'PERF_HUD_OFF',
    'PERF_HUD_PERF_SUMMARY',
    'PERF_HUD_LATENCY_TIMING',
    'PERF_HUD_APP_RENDER_TIMING',
    'PERF_HUD_COMP_RENDER_TIMING',
    'PERF_HUD_ASW_STATS',
    'PERF_HUD_VERSION_INFO',
    'DEBUG_HUD_STEREO_MODE_OFF',
    'DEBUG_HUD_STEREO_MODE_QUAD',
    'DEBUG_HUD_STEREO_MODE_QUAD_WITH_CROSSHAIR',
    'DEBUG_HUD_STEREO_MODE_CROSSHAIR_AT_INFINITY',
    'BOUNDARY_PLAY_AREA',
    'BOUNDARY_OUTER',
    'LAYER_FLAG_HIGH_QUALITY',
    'LAYER_FLAG_TEXTURE_ORIGIN_AT_BOTTOM_LEFT',
    'LAYER_FLAG_HEAD_LOCKED',
    'HMD_NONE',
    'HMD_DK1',
    'HMD_DKHD',
    'HMD_DK2',
    'HMD_CB',
    'HMD_OTHER',
    'HMD_E3_2015',
    'HMD_ES06',
    'HMD_ES09',
    'HMD_ES11',
    'HMD_CV1',
    'HMD_RIFTS',
    'HAPTICS_BUFFER_SAMPLES_MAX',
    'MIRROR_OPTION_DEFAULT',
    'MIRROR_OPTION_POST_DISTORTION',
    'MIRROR_OPTION_LEFT_EYE_ONLY',
    'MIRROR_OPTION_RIGHT_EYE_ONLY',
    'MIRROR_OPTION_INCLUDE_GUARDIAN',
    'MIRROR_OPTION_INCLUDE_NOTIFICATIONS',
    'MIRROR_OPTION_INCLUDE_SYSTEM_GUI',
    'MIRROR_OPTION_FORCE_SYMMETRIC_FOV',
    'LOG_LEVEL_DEBUG',
    'LOG_LEVEL_INFO',
    'LOG_LEVEL_ERROR',
    'HMD_RIFTS',
    'LibOVRPose',
    'LibOVRPoseState',
    'LibOVRTrackingState',
    'LibOVRBounds',
    'LibOVRTrackerInfo',
    'LibOVRHmdInfo',
    'LibOVRSessionStatus',
    'LibOVRBoundaryTestResult',
    'LibOVRPerfStatsPerCompositorFrame',
    'LibOVRPerfStats',
    'LibOVRHapticsInfo',
    'LibOVRHapticsBuffer',
    'success',
    'unqualifiedSuccess',
    'failure',
    'setBool',
    'getBool',
    'setInt',
    'getInt',
    'setFloat',
    'getFloat',
    'getFloatArray',
    'setFloatArray',
    'setString',
    'getString',
    'isOculusServiceRunning',
    'isHmdConnected',
    'getHmdInfo',
    'initialize',
    'create',
    'destroyTextureSwapChain',
    'destroyMirrorTexture',
    'destroy',
    'shutdown',
    'getGraphicsLUID',
    'setHighQuality',
    'setHeadLocked',
    'isHeadLocked',
    'getPixelsPerTanAngleAtCenter',
    'getTanAngleToRenderTargetNDC',
    'getPixelsPerDegree',
    'getDistortedViewport',
    'getEyeRenderFov',
    'setEyeRenderFov',
    'getEyeAspectRatio',
    'getEyeHorizontalFovRadians',
    'getEyeVerticalFovRadians',
    'getEyeFocalLength',
    'calcEyeBufferSize',
    'getLayerEyeFovFlags',
    'setLayerEyeFovFlags',
    'createTextureSwapChainGL',
    'getTextureSwapChainLengthGL',
    'getTextureSwapChainCurrentIndex',
    'getTextureSwapChainBufferGL',
    'setEyeColorTextureSwapChain',
    'createMirrorTexture',
    'getMirrorTexture',
    'getSensorSampleTime',
    'setSensorSampleTime',
    'getTrackingState',
    'getDevicePoses',
    'calcEyePoses',
    'getHmdToEyePose',
    'setHmdToEyePose',
    'getEyeRenderPose',
    'setEyeRenderPose',
    'getEyeProjectionMatrix',
    'getEyeRenderViewport',
    'setEyeRenderViewport',
    'getEyeViewMatrix',
    'getPredictedDisplayTime',
    'timeInSeconds',
    'waitToBeginFrame',
    'beginFrame',
    'commitTextureSwapChain',
    'endFrame',
    'getTrackingOriginType',
    'setTrackingOriginType',
    'recenterTrackingOrigin',
    'specifyTrackingOrigin',
    'clearShouldRecenterFlag',
    'getTrackerCount',
    'getTrackerInfo',
    'getSessionStatus',
    'getPerfStats',
    'resetPerfStats',
    'getLastErrorInfo',
    'setBoundaryColor',
    'resetBoundaryColor',
    'getBoundaryVisible',
    'showBoundary',
    'hideBoundary',
    'getBoundaryDimensions',
    'testBoundary',
    'getConnectedControllerTypes',
    'updateInputState',
    'getButton',
    'getTouch',
    'getThumbstickValues',
    'getIndexTriggerValues',
    'getHandTriggerValues',
    'setControllerVibration',
    'getHapticsInfo',
    'submitControllerVibration',
    'getControllerPlaybackState',
    'cullPose',
    'checkSessionStarted'
]


from .cimport libovr_capi as capi
from .cimport libovr_math

from libc.stdint cimport int32_t, uint32_t, uintptr_t
from cpython.mem cimport PyMem_Malloc, PyMem_Free
from libc.math cimport pow, tan, M_PI, atan2

cimport numpy as np
import numpy as np
np.import_array()

import warnings
import ctypes

# ------------------------------------------------------------------------------
# Initialize module
#
cdef capi.ovrInitParams _initParams  # initialization parameters
cdef capi.ovrSession _ptrSession  # session pointer
cdef capi.ovrGraphicsLuid _gfxLuid  # LUID
cdef capi.ovrHmdDesc _hmdDesc  # HMD information descriptor
cdef capi.ovrBoundaryLookAndFeel _boundaryStyle
cdef capi.ovrTextureSwapChain[16] _swapChains
cdef capi.ovrMirrorTexture _mirrorTexture

# VR related data persistent across frames
cdef capi.ovrLayerEyeFov _eyeLayer
cdef capi.ovrPosef[2] _eyeRenderPoses
cdef capi.ovrEyeRenderDesc[2] _eyeRenderDesc
# cdef capi.ovrViewScaleDesc _viewScale

# near and far clipping planes
cdef float[2] _nearClip
cdef float[2] _farClip

# prepare the render layer
_eyeLayer.Header.Type = capi.ovrLayerType_EyeFov
_eyeLayer.Header.Flags = \
    capi.ovrLayerFlag_TextureOriginAtBottomLeft | \
    capi.ovrLayerFlag_HighQuality
_eyeLayer.ColorTexture[0] = _eyeLayer.ColorTexture[1] = NULL

# status and performance information
cdef capi.ovrSessionStatus _sessionStatus

# error information
cdef capi.ovrErrorInfo _errorInfo  # store our last error here

# controller states
cdef capi.ovrInputState[9] _inputStates
cdef capi.ovrInputState[9] _prevInputState

# geometric data
cdef libovr_math.Matrix4f[2] _eyeProjectionMatrix
cdef libovr_math.Matrix4f[2] _eyeViewMatrix
cdef libovr_math.Matrix4f[2] _eyeViewProjectionMatrix

# clock offset in seconds
cdef double t_offset = 0.0

# Function to check for errors returned by OVRLib functions
#
cdef capi.ovrErrorInfo _last_error_info_  # store our last error here
def check_result(result):
    if capi.OVR_FAILURE(result):
        capi.ovr_GetLastErrorInfo(&_last_error_info_)
        raise RuntimeError(
            str(result) + ": " + _last_error_info_.ErrorString.decode("utf-8"))

# helper functions and data
RAD_TO_DEGF = <float>180.0 / M_PI
DEG_TO_RADF = M_PI / <float>180.0


cdef float maxf(float a, float b):
    return a if a >= b else b


cdef char* str2bytes(str strIn):
    """Convert UTF-8 encoded strings to bytes."""
    py_bytes = strIn.encode('UTF-8')
    cdef char* to_return = py_bytes

    return to_return


cdef str bytes2str(char* bytesIn):
    """Convert UTF-8 encoded strings to bytes."""
    return bytesIn.decode('UTF-8')

# ------------------------------------------------------------------------------
# Version checker

if capi.OVR_MAJOR_VERSION != 1 or capi.OVR_MINOR_VERSION != 43:
    # raise a warning if the version of the Oculus SDK may be incompatible
    warnings.warn(
        "PsychXR was built using version {major}.{minor} of the Oculus PC SDK "
        "however 1.43 is recommended. This might be perfectly fine if there "
        "aren't any API breaking changes between versions.".format(
            major=capi.OVR_MAJOR_VERSION, minor=capi.OVR_MINOR_VERSION),
        RuntimeWarning)

# ------------------------------------------------------------------------------
# Logging Callback
#

cdef void LibOVRLogCallback(uintptr_t userData, int level, char* message) with gil:
    """Callback function for LibOVR logging messages.
    """
    (<object>(<void*>userData))(level, bytes2str(message))


# ------------------------------------------------------------------------------
# Constants

include "libovr_const.pxi"

# ------------------------------------------------------------------------------
# Wrapper factory functions
#
include "libovr_wrappers.pxi"

# ------------------------------------------------------------------------------
# Classes and extension types
#

include "libovr_pose.pxi"
include "libovr_posestate.pxi"


cdef class LibOVRTrackingState(object):
    """Class for tracking state information.

    Instances of this class are returned by :func:`getTrackingState` calls, with
    data referenced to the specified absolute time. Pose states with tracked
    position and orientation, as well as first and second order motion
    derivatives, for the head and hands can be accessed through attributes
    :py:attr:`~LibOVRTrackingState.headPose` and
    :py:attr:`~LibOVRTrackingState.handPoses`.

    Status flags describe the status of sensor tracking when a tracking
    state was sampled, accessible for the head and hands through the
    :py:attr:`~LibOVRTrackingState.statusFlags` and
    :py:attr:`~LibOVRTrackingState.handStatusFlags`, respectively. You can
    check each status bit by using the following values:

    * ``STATUS_ORIENTATION_TRACKED``: Orientation is tracked/reported.
    * ``STATUS_ORIENTATION_VALID``: Orientation is valid for application use.
    * ``STATUS_POSITION_TRACKED``: Position is tracked/reported.
    * ``STATUS_POSITION_VALID``: Position is valid for application use.

    As of SDK 1.39, `*_VALID` flags should be used to determine if tracking data
    is usable by the application.

    """
    cdef capi.ovrTrackingState* c_data
    cdef bint ptr_owner

    cdef LibOVRPoseState _headPoseState
    cdef LibOVRPoseState _leftHandPoseState
    cdef LibOVRPoseState _rightHandPoseState
    cdef LibOVRPose _calibratedOrigin

    def __init__(self):
        """
        Attributes
        ----------
        headPose : LibOVRPoseState
        handPoses : tuple
        statusFlags : int
        positionValid : bool
        orientationValid : bool
        handStatusFlags : tuple
        handPositionValid : tuple
        handOrientationValid : tuple
        calibratedOrigin : LibOVRPose
        """
        self._new_struct()

    def __cinit__(self):
        self.ptr_owner = False

    @staticmethod
    cdef LibOVRTrackingState fromPtr(capi.ovrTrackingState* ptr, bint owner=False):
        cdef LibOVRTrackingState wrapper = \
            LibOVRTrackingState.__new__(LibOVRTrackingState)
        wrapper.c_data = ptr
        wrapper.ptr_owner = owner

        wrapper._headPoseState = LibOVRPoseState.fromPtr(&ptr.HeadPose)
        wrapper._leftHandPoseState = LibOVRPoseState.fromPtr(&ptr.HandPoses[0])
        wrapper._rightHandPoseState = LibOVRPoseState.fromPtr(&ptr.HandPoses[1])
        wrapper._calibratedOrigin = LibOVRPose.fromPtr(&ptr.CalibratedOrigin)

        return wrapper

    cdef void _new_struct(self):
        if self.c_data is not NULL:
            return

        cdef capi.ovrTrackingState* ptr = \
            <capi.ovrTrackingState*>PyMem_Malloc(sizeof(capi.ovrTrackingState))

        if ptr is NULL:
            raise MemoryError

        self.c_data = ptr
        self.ptr_owner = True

        self._headPoseState = LibOVRPoseState.fromPtr(&ptr.HeadPose)
        self._leftHandPoseState = LibOVRPoseState.fromPtr(&ptr.HandPoses[0])
        self._rightHandPoseState = LibOVRPoseState.fromPtr(&ptr.HandPoses[1])
        self._calibratedOrigin = LibOVRPose.fromPtr(&ptr.CalibratedOrigin)

    def __dealloc__(self):
        if self.c_data is not NULL:
            if self.ptr_owner is True:
                PyMem_Free(self.c_data)
                self.c_data = NULL

    @property
    def headPose(self):
        """Head pose state (`LibOVRPoseState`)."""
        return self._headPoseState

    @property
    def handPoses(self):
        """Hand pose states (`LibOVRPoseState`, `LibOVRPoseState`).

        Examples
        --------
        Get the left and right hand pose states::

            leftHandPoseState, rightHandPoseState = trackingState.handPoses

        """
        return self._leftHandPoseState, self._rightHandPoseState

    @property
    def statusFlags(self):
        """Head tracking status flags (`int`).

        Examples
        --------
        Check if orientation was tracked and data is valid for use::

            # check if orientation is tracked and valid
            statusFlags = STATUS_ORIENTATION_TRACKED | STATUS_ORIENTATION_VALID
            if (trackingState.statusFlags & statusFlags) == statusFlags:
                print("Orientation is tracked and valid")

        """
        return self.c_data.StatusFlags

    @property
    def positionValid(self):
        """`True` if position tracking is valid."""
        return (self.c_data.StatusFlags & STATUS_POSITION_VALID) == \
               STATUS_POSITION_VALID

    @property
    def orientationValid(self):
        """`True` if orientation tracking is valid."""
        return (self.c_data.StatusFlags & STATUS_ORIENTATION_VALID) == \
               STATUS_ORIENTATION_VALID

    @property
    def handStatusFlags(self):
        """Hand tracking status flags (`int`, `int`)."""
        return self.c_data.HandStatusFlags[0], self.c_data.HandStatusFlags[1]

    @property
    def handPositionValid(self):
        """`True` if position tracking is valid."""
        return (self.c_data.StatusFlags & STATUS_POSITION_VALID) == \
               STATUS_POSITION_VALID

    @property
    def handOrientationValid(self):
        """Hand orientation tracking is valid (`bool`, `bool`).

        Examples
        --------
        Check if orientation is valid for the right hand's tracking state::

            rightHandOriTracked = trackingState.handOrientationValid[HAND_RIGHT]

        """
        cdef bint left_hand = (
            self.c_data.HandStatusFlags[HAND_LEFT] &
                STATUS_ORIENTATION_VALID) == STATUS_ORIENTATION_VALID
        cdef bint right_hand = (
            self.c_data.HandStatusFlags[HAND_RIGHT] &
                STATUS_ORIENTATION_VALID) == STATUS_ORIENTATION_VALID

        return left_hand, right_hand

    @property
    def handPositionValid(self):
        """Hand position tracking is valid (`bool`, `bool`).

        Examples
        --------
        Check if position is valid for the right hand's tracking state::

            rightHandOriTracked = trackingState.handPositionValid[HAND_RIGHT]

        """
        cdef bint left_hand = (
            self.c_data.HandStatusFlags[HAND_LEFT] &
                STATUS_POSITION_VALID) == STATUS_POSITION_VALID
        cdef bint right_hand = (
            self.c_data.HandStatusFlags[HAND_RIGHT] &
                STATUS_POSITION_VALID) == STATUS_POSITION_VALID

        return left_hand, right_hand

    @property
    def calibratedOrigin(self):
        """Pose of the calibrated origin.

        This pose is used to find the calibrated origin in space if
        :func:`recenterTrackingOrigin` or :func:`specifyTrackingOrigin` was
        called. If those functions were never called during a session, this will
        return an identity pose, which reflects the tracking origin type.

        """
        return self._calibratedOrigin


cdef class LibOVRBounds(object):
    """Class for constructing and representing 3D axis-aligned bounding boxes.

    A bounding box is a construct which represents a 3D rectangular volume
    about some pose, defined by its minimum and maximum extents in the reference
    frame of the pose. The axes of the bounding box are aligned to the axes of
    the world or the associated pose.

    Bounding boxes are primarily used for visibility testing; to determine if
    the extents of an object associated with a pose (eg. the vertices of a
    model) falls completely outside of the viewing frustum. If so, the model can
    be culled during rendering to avoid wasting CPU/GPU resources on objects not
    visible to the viewer. See :func:`cullPose` for more information.

    Parameters
    ----------
    extents : tuple, optional
        Minimum and maximum extents of the bounding box (`mins`, `maxs`) where
        `mins` and `maxs` specified as coordinates [x, y, z]. If no extents are
        specified, the bounding box will be invalid until defined.

    Examples
    --------
    Create a bounding box and add it to a pose::

            # minumum and maximum extents of the bounding box
            mins = (-.5, -.5, -.5)
            maxs = (.5, .5, .5)
            bounds = (mins, maxs)
            # create the bounding box and add it to a pose
            bbox = LibOVRBounds(bounds)
            modelPose = LibOVRPose()
            modelPose.boundingBox = bbox

    """
    cdef libovr_math.Bounds3f* c_data
    cdef bint ptr_owner

    cdef np.ndarray _mins
    cdef np.ndarray _maxs

    def __init__(self, object extents=None):
        """
        Attributes
        ----------
        isValid : bool
        extents : tuple
        mins : ndarray
        maxs : ndarray
        """
        self._new_struct(extents)

    def __cinit__(self, *args, **kwargs):
        self.ptr_owner = False

    @staticmethod
    cdef LibOVRBounds fromPtr(libovr_math.Bounds3f* ptr, bint owner=False):
        cdef LibOVRBounds wrapper = LibOVRBounds.__new__(LibOVRBounds)
        wrapper.c_data = ptr
        wrapper.ptr_owner = owner

        wrapper._mins = _wrap_ovrVector3f_as_ndarray(<capi.ovrVector3f*>&ptr.b[0])
        wrapper._maxs = _wrap_ovrVector3f_as_ndarray(<capi.ovrVector3f*>&ptr.b[1])

        return wrapper

    cdef void _new_struct(self, object extents):
        if self.c_data is not NULL:
            return

        cdef libovr_math.Bounds3f* ptr = \
            <libovr_math.Bounds3f*>PyMem_Malloc(sizeof(libovr_math.Bounds3f))

        if ptr is NULL:
            raise MemoryError

        if extents is not None:
            ptr.b[0].x = <float>extents[0][0]
            ptr.b[0].y = <float>extents[0][1]
            ptr.b[0].z = <float>extents[0][2]
            ptr.b[1].x = <float>extents[1][0]
            ptr.b[1].y = <float>extents[1][1]
            ptr.b[1].z = <float>extents[1][2]
        else:
            ptr.Clear()

        self.c_data = ptr
        self.ptr_owner = True

        self._mins = _wrap_ovrVector3f_as_ndarray(<capi.ovrVector3f*>&ptr.b[0])
        self._maxs = _wrap_ovrVector3f_as_ndarray(<capi.ovrVector3f*>&ptr.b[1])

    def __dealloc__(self):
        if self.c_data is not NULL:
            if self.ptr_owner is True:
                PyMem_Free(self.c_data)
                self.c_data = NULL

    def clear(self):
        """Clear the bounding box."""
        self.c_data.Clear()

    @property
    def isValid(self):
        """``True`` if a bounding box is valid. Bounding boxes are valid if all
        dimensions of `mins` are less than each of `maxs` which is the case
        after :py:meth:`~LibOVRBounds.clear` is called.

        If a bounding box is invalid, :func:`cullPose` will always return
        ``True``.

        """
        if self.c_data.b[1].x <= self.c_data.b[0].x and \
                self.c_data.b[1].y <= self.c_data.b[0].y and \
                self.c_data.b[1].z <= self.c_data.b[0].z:
            return False

        return True

    def fit(self, object points, bint clear=True):
        """Fit an axis aligned bounding box to enclose specified points. The
        resulting bounding box is guaranteed to enclose all points, however
        volume is not necessarily minimized or optimal.

        Parameters
        ----------
        points : array_like
            2D array of points [x, y, z] to fit, can be a list of vertices from
            a 3D model associated with the bounding box.
        clear : bool, optional
            Clear the bounding box prior to fitting. If ``False`` the current
            bounding box will be re-sized to fit new points.

        Examples
        --------
        Create a bounding box around vertices specified in a list::

            # model vertices
            vertices = [[-1.0, -1.0, 0.0],
                        [-1.0, 1.0, 0.0],
                        [1.0, 1.0, 0.0],
                        [1.0, -1.0, 0.0]]

            # create an empty bounding box
            bbox = LibOVRBounds()
            bbox.fit(vertices)

            # associate the bounding box to a pose
            modelPose = LibOVRPose()
            modelPose.bounds = bbox

        """
        cdef np.ndarray[np.float32_t, ndim=2] points_in = np.asarray(
            points, dtype=np.float32)
        cdef libovr_math.Vector3f new_point = libovr_math.Vector3f()

        if clear:
            self.c_data.Clear()

        cdef Py_ssize_t i, N
        cdef float[:, :] mv_points = points_in  # memory view
        N = <Py_ssize_t>points_in.shape[0]
        for i in range(N):
            new_point.x = mv_points[i, 0]
            new_point.y = mv_points[i, 1]
            new_point.z = mv_points[i, 2]
            self.c_data.AddPoint(new_point)

    def addPoint(self, object point):
        """Resize the bounding box to encompass a given point. Calling this
        function for each vertex of a model will create an optimal bounding box
        for it.

        Parameters
        ----------
        point : array_like
            Vector/coordinate to add [x, y, z].

        See Also
        --------
        fit : Fit a bounding box to enclose a list of points.

        """
        cdef libovr_math.Vector3f new_point = libovr_math.Vector3f(
            <float>point[0], <float>point[1], <float>point[2])

        self.c_data.AddPoint(new_point)

    @property
    def extents(self):
        """The extents of the bounding box (`mins`, `maxs`)."""
        return self._mins, self._maxs

    @extents.setter
    def extents(self, object value):
        self._mins[:] = value[0]
        self._maxs[:] = value[1]

    @property
    def mins(self):
        """Point defining the minimum extent of the bounding box."""
        return self._mins

    @mins.setter
    def mins(self, object value):
        self._mins[:] = value

    @property
    def maxs(self):
        """Point defining the maximum extent of the bounding box."""
        return self._maxs

    @maxs.setter
    def maxs(self, object value):
        self._mins[:] = value


cdef class LibOVRTrackerInfo(object):
    """Class for storing tracker (sensor) information such as pose, status, and
    camera frustum information. This object is returned by calling
    :func:`~psychxr.libovr.getTrackerInfo`. Attributes of this class are
    read-only.

    """
    cdef capi.ovrTrackerPose c_ovrTrackerPose
    cdef capi.ovrTrackerDesc c_ovrTrackerDesc

    cdef LibOVRPose _pose
    cdef LibOVRPose _leveledPose

    cdef unsigned int _trackerIndex

    def __init__(self):
        """
        Attributes
        ----------
        trackerIndex : int
            Tracker index this objects refers to (read-only).
        pose : LibOVRPose
            The pose of the sensor (read-only).
        leveledPose : LibOVRPose
            Gravity aligned pose of the sensor (read-only).
        isConnected : bool
            True if the sensor is connected and available (read-only).
        isPoseTracked : bool
            True if the sensor has a valid pose (read-only).
        horizontalFov : float
            Horizontal FOV of the sensor in radians (read-only).
        verticalFov : float
            Vertical FOV of the sensor in radians (read-only).
        nearZ : float
            Near clipping plane of the sensor frustum in meters (read-only).
        farZ : float
            Far clipping plane of the sensor frustum in meters (read-only).

        """
        pass

    def __cinit__(self):
        self._pose = LibOVRPose.fromPtr(&self.c_ovrTrackerPose.Pose)
        self._leveledPose = LibOVRPose.fromPtr(&self.c_ovrTrackerPose.LeveledPose)

    @property
    def trackerIndex(self):
        """Tracker index this objects refers to (read-only)."""
        return self._trackerIndex

    @property
    def pose(self):
        """The pose of the sensor (read-only)."""
        return self._pose

    @property
    def leveledPose(self):
        """Gravity aligned pose of the sensor (read-only)."""
        return self._leveledPose

    @property
    def isConnected(self):
        """True if the sensor is connected and available (read-only)."""
        return <bint>((capi.ovrTracker_Connected &
             self.c_ovrTrackerPose.TrackerFlags) ==
                      capi.ovrTracker_Connected)

    @property
    def isPoseTracked(self):
        """True if the sensor has a valid pose (read-only)."""
        return <bint>((capi.ovrTracker_PoseTracked &
             self.c_ovrTrackerPose.TrackerFlags) ==
                      capi.ovrTracker_PoseTracked)

    @property
    def horizontalFov(self):
        """Horizontal FOV of the sensor in radians (read-only)."""
        return self.c_ovrTrackerDesc.FrustumHFovInRadians

    @property
    def verticalFov(self):
        """Vertical FOV of the sensor in radians (read-only)."""
        return self.c_ovrTrackerDesc.FrustumVFovInRadians

    @property
    def nearZ(self):
        """Near clipping plane of the sensor frustum in meters (read-only)."""
        return self.c_ovrTrackerDesc.FrustumNearZInMeters

    @property
    def farZ(self):
        """Far clipping plane of the sensor frustum in meters (read-only)."""
        return self.c_ovrTrackerDesc.FrustumFarZInMeters


cdef class LibOVRHmdInfo(object):
    """Class for general HMD information and capabilities. An instance of this
    class is returned by calling :func:`~psychxr.libovr.getHmdInfo`.

    """
    cdef capi.ovrHmdDesc* c_data
    cdef bint ptr_owner

    def __init__(self):
        """
        Attributes
        ----------
        hmdType : int
        hasOrientationTracking : bool
        hasPositionTracking : bool
        hasMagYawCorrection : bool
        isDebugDevice : bool
        productName : str
        manufacturer : str
        serialNumber : str
        resolution : tuple
        refreshRate : float
        hid : tuple
        firmwareVersion : tuple
        defaultEyeFov : tuple (ndarray and ndarray)
        maxEyeFov : tuple (ndarray and ndarray)
        symmetricEyeFov : tuple (ndarray and ndarray)

        """
        self.newStruct()

    def __cinit__(self):
        self.ptr_owner = False

    @staticmethod
    cdef LibOVRHmdInfo fromPtr(capi.ovrHmdDesc* ptr, bint owner=False):
        # bypass __init__ if wrapping a pointer
        cdef LibOVRHmdInfo wrapper = LibOVRHmdInfo.__new__(LibOVRHmdInfo)
        wrapper.c_data = ptr
        wrapper.ptr_owner = owner

        return wrapper

    cdef void newStruct(self):
        if self.c_data is not NULL:  # already allocated, __init__ called twice?
            return

        cdef capi.ovrHmdDesc* _ptr = <capi.ovrHmdDesc*>PyMem_Malloc(
            sizeof(capi.ovrHmdDesc))

        if _ptr is NULL:
            raise MemoryError

        self.c_data = _ptr
        self.ptr_owner = True

    def __dealloc__(self):
        if self.c_data is not NULL and self.ptr_owner is True:
            PyMem_Free(self.c_data)
            self.c_data = NULL

    @property
    def hmdType(self):
        """HMD type currently used.

        Valid values returned are ``HMD_NONE``, ``HMD_DK1``, ``HMD_DKHD``,
        ``HMD_DK2``, ``HMD_CB``, ``HMD_OTHER``, ``HMD_E3_2015``, ``HMD_ES06``,
        ``HMD_ES09``, ``HMD_ES11``, `HMD_CV1``, ``HMD_RIFTS``.

        """
        return <int>self.c_data.Type

    @property
    def hasOrientationTracking(self):
        """``True`` if the HMD is capable of tracking orientation."""
        return (self.c_data.AvailableTrackingCaps &
                capi.ovrTrackingCap_Orientation) == \
               capi.ovrTrackingCap_Orientation

    @property
    def hasPositionTracking(self):
        """``True`` if the HMD is capable of tracking position."""
        return (self.c_data.AvailableTrackingCaps &
                capi.ovrTrackingCap_Position) == capi.ovrTrackingCap_Position

    @property
    def hasMagYawCorrection(self):
        """``True`` if this HMD supports yaw drift correction."""
        return (self.c_data.AvailableTrackingCaps &
                capi.ovrTrackingCap_MagYawCorrection) == \
               capi.ovrTrackingCap_MagYawCorrection

    @property
    def isDebugDevice(self):
        """``True`` if the HMD is a virtual debug device."""
        return (self.c_data.AvailableHmdCaps & capi.ovrHmdCap_DebugDevice) == \
               capi.ovrHmdCap_DebugDevice

    @property
    def productName(self):
        """Get the product name for this device.

        Returns
        -------
        str
            Product name string (utf-8).

        """
        return self.c_data[0].ProductName.decode('utf-8')

    @property
    def manufacturer(self):
        """Get the device manufacturer name.

        Returns
        -------
        str
            Manufacturer name string (utf-8).

        """
        return self.c_data[0].Manufacturer.decode('utf-8')

    @property
    def serialNumber(self):
        """Get the device serial number.

        Returns
        -------
        str
            Serial number (utf-8).

        """
        return self.c_data[0].SerialNumber.decode('utf-8')

    @property
    def resolution(self):
        """Horizontal and vertical resolution of the display in pixels.

        Returns
        -------
        ndarray
            Resolution of the display [w, h].

        """
        return np.asarray((self.c_data[0].Resolution.w,
                           self.c_data[0].Resolution.h), dtype=int)

    @property
    def refreshRate(self):
        """Nominal refresh rate in Hertz of the display.

        Returns
        -------
        ndarray
            Refresh rate in Hz.

        """
        return <float>self.c_data[0].DisplayRefreshRate

    @property
    def hid(self):
        """USB human interface device class identifiers.

        Returns
        -------
        tuple (int, int)
            USB HIDs (vendor, product).

        """
        return <int>self.c_data[0].VendorId, <int>self.c_data[0].ProductId

    @property
    def firmwareVersion(self):
        """Firmware version for this device.

        Returns
        -------
        tuple (int, int)
            Firmware version (major, minor).

        """
        return <int>self.c_data[0].FirmwareMajor, \
               <int>self.c_data[0].FirmwareMinor

    @property
    def defaultEyeFov(self):
        """Default or recommended eye field-of-views (FOVs) provided by the API.

        Returns
        -------
        tuple (ndarray, ndarray)
            Pair of left and right eye FOVs specified as tangent angles [Up,
            Down, Left, Right].

        """
        cdef np.ndarray fovLeft = np.asarray([
            self.c_data[0].DefaultEyeFov[0].UpTan,
            self.c_data[0].DefaultEyeFov[0].DownTan,
            self.c_data[0].DefaultEyeFov[0].LeftTan,
            self.c_data[0].DefaultEyeFov[0].RightTan],
            dtype=np.float32)

        cdef np.ndarray fovRight = np.asarray([
            self.c_data[0].DefaultEyeFov[1].UpTan,
            self.c_data[0].DefaultEyeFov[1].DownTan,
            self.c_data[0].DefaultEyeFov[1].LeftTan,
            self.c_data[0].DefaultEyeFov[1].RightTan],
            dtype=np.float32)

        return fovLeft, fovRight

    @property
    def maxEyeFov(self):
        """Maximum eye field-of-views (FOVs) provided by the API.

        Returns
        -------
        tuple (ndarray, ndarray)
            Pair of left and right eye FOVs specified as tangent angles in
            radians [Up, Down, Left, Right].

        """
        cdef np.ndarray[float, ndim=1] fov_left = np.asarray([
            self.c_data[0].MaxEyeFov[0].UpTan,
            self.c_data[0].MaxEyeFov[0].DownTan,
            self.c_data[0].MaxEyeFov[0].LeftTan,
            self.c_data[0].MaxEyeFov[0].RightTan],
            dtype=np.float32)

        cdef np.ndarray[float, ndim=1] fov_right = np.asarray([
            self.c_data[0].MaxEyeFov[1].UpTan,
            self.c_data[0].MaxEyeFov[1].DownTan,
            self.c_data[0].MaxEyeFov[1].LeftTan,
            self.c_data[0].MaxEyeFov[1].RightTan],
            dtype=np.float32)

        return fov_left, fov_right

    @property
    def symmetricEyeFov(self):
        """Symmetric field-of-views (FOVs) for mono rendering.

        By default, the Rift uses off-axis FOVs. These frustum parameters make
        it difficult to converge monoscopic stimuli.

        Returns
        -------
        tuple (ndarray, ndarray)
            Pair of left and right eye FOVs specified as tangent angles in
            radians [Up, Down, Left, Right]. Both FOV objects will have the same
            values.

        """
        cdef libovr_math.FovPort fov_left = \
            <libovr_math.FovPort>self.c_data[0].DefaultEyeFov[0]
        cdef libovr_math.FovPort fov_right = \
            <libovr_math.FovPort>self.c_data[0].DefaultEyeFov[1]

        cdef libovr_math.FovPort fov_max = libovr_math.FovPort.Max(
            <libovr_math.FovPort>fov_left, <libovr_math.FovPort>fov_right)

        cdef float tan_half_fov_horz = maxf(fov_max.LeftTan, fov_max.RightTan)
        cdef float tan_half_fov_vert = maxf(fov_max.DownTan, fov_max.UpTan)

        cdef capi.ovrFovPort fov_both
        fov_both.LeftTan = fov_both.RightTan = tan_half_fov_horz
        fov_both.UpTan = fov_both.DownTan = tan_half_fov_horz

        cdef np.ndarray[float, ndim=1] fov_left_out = np.asarray([
            fov_both.UpTan,
            fov_both.DownTan,
            fov_both.LeftTan,
            fov_both.RightTan],
            dtype=np.float32)

        cdef np.ndarray[float, ndim=1] fov_right_out = np.asarray([
            fov_both.UpTan,
            fov_both.DownTan,
            fov_both.LeftTan,
            fov_both.RightTan],
            dtype=np.float32)

        return fov_left_out, fov_right_out


cdef class LibOVRSessionStatus(object):
    """Class for storing session status information. An instance of this class
    is returned when :func:`getSessionStatus` is called.

    One can check if there was a status change between calls of
    :func:`getSessionStatus` by using the ``==`` and ``!=`` operators on the
    returned :py:class:`LibOVRSessionStatus` instances.

    """
    cdef capi.ovrSessionStatus c_data

    def __init__(self):
        """
        Attributes
        ----------
        isVisible : bool
        hmdPresent : bool
        hmdMounted : bool
        displayLost : bool
        shouldQuit : bool
        shouldRecenter : bool
        hasInputFocus : bool
        overlayPresent : bool
        depthRequested : bool

        """
        pass

    def __cinit__(self):
        pass

    def __eq__(self, LibOVRSessionStatus other):
        """Equality test between status objects. Use this to check if the status
        is unchanged between two :func:`getSessionStatus` calls.

        """
        return (self.c_data.IsVisible == other.c_data.IsVisible and
               self.c_data.HmdPresent == other.c_data.HmdPresent and
               self.c_data.hmdMounted == other.c_data.hmdMounted and
               self.c_data.displayLost == other.c_data.displayLost and
               self.c_data.shouldQuit == other.c_data.shouldQuit and
               self.c_data.shouldRecenter == other.c_data.shouldRecenter and
               self.c_data.hasInputFocus == other.c_data.hasInputFocus and
               self.c_data.overlayPresent == other.c_data.overlayPresent and
               self.c_data.depthRequested == other.c_data.depthRequested)

    def __ne__(self, LibOVRSessionStatus other):
        """Equality test between status objects. Use this to check if the status
        differs between two :func:`getSessionStatus` calls.

        """
        return not (self.c_data.IsVisible == other.c_data.IsVisible and
               self.c_data.HmdPresent == other.c_data.HmdPresent and
               self.c_data.hmdMounted == other.c_data.hmdMounted and
               self.c_data.displayLost == other.c_data.displayLost and
               self.c_data.shouldQuit == other.c_data.shouldQuit and
               self.c_data.shouldRecenter == other.c_data.shouldRecenter and
               self.c_data.hasInputFocus == other.c_data.hasInputFocus and
               self.c_data.overlayPresent == other.c_data.overlayPresent and
               self.c_data.depthRequested == other.c_data.depthRequested)

    @property
    def isVisible(self):
        """``True`` the application has focus and visible in the HMD."""
        return self.c_data.IsVisible == capi.ovrTrue

    @property
    def hmdPresent(self):
        """``True`` if the HMD is present."""
        return self.c_data.HmdPresent == capi.ovrTrue

    @property
    def hmdMounted(self):
        """``True`` if the HMD is being worn on the user's head."""
        return self.c_data.HmdMounted == capi.ovrTrue

    @property
    def displayLost(self):
        """``True`` the the display was lost.

        If occurs, the HMD was disconnected and the current session is invalid.
        You need to destroy all resources associated with current session and
        call :func:`create` again. Alternatively, you can raise an error and
        shutdown the application.
        """
        return self.c_data.DisplayLost == capi.ovrTrue

    @property
    def shouldQuit(self):
        """``True`` the application was signaled to quit.

        This can occur if the user requests the application exit through the
        system UI menu. You can ignore this flag if needed.
        """
        return self.c_data.ShouldQuit == capi.ovrTrue

    @property
    def shouldRecenter(self):
        """``True`` if the application was signaled to recenter.

        This happens when the user requests the application recenter the VR
        scene on their current physical location through the system UI. You can
        ignore this request or clear it by calling
        :func:`clearShouldRecenterFlag`.

        """
        return self.c_data.ShouldRecenter == capi.ovrTrue

    @property
    def hasInputFocus(self):
        """``True`` if the application has input focus.

        If the application has focus, the statistics presented by the
        performance HUD will reflect the current application's frame statistics.

        """
        return self.c_data.HasInputFocus == capi.ovrTrue

    @property
    def overlayPresent(self):
        """``True`` if the system UI is visible."""
        return self.c_data.OverlayPresent == capi.ovrTrue

    @property
    def depthRequested(self):
        """``True`` if the a depth texture is requested.

        Notes
        -----
        * This feature is currently unused by PsychXR.

        """
        return self.c_data.DepthRequested == capi.ovrTrue


cdef class LibOVRBoundaryTestResult(object):
    """Class for boundary collision test data. An instance of this class is
    returned when :func:`testBoundary` is called.

    """
    cdef capi.ovrBoundaryTestResult c_data

    def __init__(self):
        """
        Attributes
        ----------
        isTriggering : bool (read-only)
        closestDistance : float (read-only)
        closestPoint : ndarray (read-only)
        closestPointNormal : ndarray (read-only)

        """
        pass

    def __cinit__(self):
        pass

    @property
    def isTriggering(self):
        """``True`` if the play area boundary is triggering. Since the boundary
        fades-in, it might not be perceptible when this is called.
        """
        return self.c_data.IsTriggering == capi.ovrTrue

    @property
    def closestDistance(self):
        """Closest point to the boundary in meters."""
        return <float>self.c_data.ClosestDistance

    @property
    def closestPoint(self):
        """Closest point on the boundary surface."""
        cdef np.ndarray[float, ndim=1] to_return = np.asarray([
            self.c_data.ClosestPoint.x,
            self.c_data.ClosestPoint.y,
            self.c_data.ClosestPoint.z],
            dtype=np.float32)

        return to_return

    @property
    def closestPointNormal(self):
        """Unit normal of the closest boundary surface."""
        cdef np.ndarray[float, ndim=1] to_return = np.asarray([
            self.c_data.ClosestPointNormal.x,
            self.c_data.ClosestPointNormal.y,
            self.c_data.ClosestPointNormal.z],
            dtype=np.float32)

        return to_return


cdef class LibOVRPerfStatsPerCompositorFrame(object):
    """Class for frame performance statistics per compositor frame.

    Instances of this class are returned by calling :func:`getPerfStats` and
    accessing the :py:attr:`LibOVRPerfStats.frameStats` field of the returned
    :class:`LibOVRPerfStats` instance.

    Data contained in this class provide information about compositor
    performance. Metrics include motion-to-photon latency, dropped frames, and
    elapsed times of various stages of frame processing to the vertical
    synchronization (V-Sync) signal of the HMD.

    Calling :func:`resetFrameStats` will reset integer fields of this class in
    successive calls to :func:`getPerfStats`.

    """
    cdef capi.ovrPerfStatsPerCompositorFrame* c_data
    cdef bint ptr_owner

    def __init__(self):
        """
        Attributes
        ----------
        hmdVsyncIndex : int
        appFrameIndex : int
        appDroppedFrameCount : int
        appMotionToPhotonLatency : float
        appQueueAheadTime : float
        appCpuElapsedTime : float
        appGpuElapsedTime : float
        compositorFrameIndex : float
        compositorDroppedFrameCount : float
        compositorLatency : float
        compositorCpuElapsedTime : float
        compositorGpuElapsedTime : float
        compositorCpuStartToGpuEndElapsedTime : float
        compositorGpuEndToVsyncElapsedTime : float
        timeToVsync : float

        """
        self._new_struct()

    def __cinit__(self):
        self.ptr_owner = False

    @staticmethod
    cdef LibOVRPerfStatsPerCompositorFrame fromPtr(
            capi.ovrPerfStatsPerCompositorFrame* ptr, bint owner=False):
        cdef LibOVRPerfStatsPerCompositorFrame wrapper = \
            LibOVRPerfStatsPerCompositorFrame.__new__(
                LibOVRPerfStatsPerCompositorFrame)

        wrapper.c_data = ptr
        wrapper.ptr_owner = owner

        return wrapper

    cdef void _new_struct(self):
        if self.c_data is not NULL:
            return

        cdef capi.ovrPerfStatsPerCompositorFrame* ptr = \
            <capi.ovrPerfStatsPerCompositorFrame*>PyMem_Malloc(
                sizeof(capi.ovrPerfStatsPerCompositorFrame))

        if ptr is NULL:
            raise MemoryError

        self.c_data = ptr
        self.ptr_owner = True

    def __dealloc__(self):
        # don't do anything crazy like set c_data=NULL without deallocating!
        if self.c_data is not NULL:
            if self.ptr_owner is True:
                PyMem_Free(self.c_data)
                self.c_data = NULL

    @property
    def hmdVsyncIndex(self):
        """Increments every HMD vertical sync signal."""
        return self.c_data.HmdVsyncIndex

    @property
    def appFrameIndex(self):
        """Index increments after each call to :func:`endFrame`."""
        return self.c_data.AppFrameIndex

    @property
    def appDroppedFrameCount(self):
        """If :func:`endFrame` is not called on-time, this will increment (i.e.
        missed HMD vertical sync deadline).

        Examples
        --------
        Check if the application dropped a frame::

            framesDropped = frameStats.frameStats[0].appDroppedFrameCount >
                lastFrameStats.frameStats[0].appDroppedFrameCount

        """
        return self.c_data.AppDroppedFrameCount

    @property
    def appMotionToPhotonLatency(self):
        """Motion-to-photon latency in seconds computed using the marker set by
        :func:`getTrackingState` or the sensor sample time set by
        :func:`setSensorSampleTime`.
        """
        return self.c_data.AppMotionToPhotonLatency

    @property
    def appQueueAheadTime(self):
        """Queue-ahead time in seconds. If >11 ms, the CPU is outpacing the GPU
        workload by 1 frame.
        """
        return self.c_data.AppQueueAheadTime

    @property
    def appCpuElapsedTime(self):
        """Time in seconds the CPU spent between calls of :func:`endFrame`. Form
        the point when :func:`endFrame` releases control back to the
        application, to the next time it is called.
        """
        return self.c_data.AppCpuElapsedTime

    @property
    def appGpuElapsedTime(self):
        """Time in seconds the GPU spent between calls of :func:`endFrame`."""
        return self.c_data.AppGpuElapsedTime

    @property
    def compositorFrameIndex(self):
        """Increments when the compositor completes a distortion pass, happens
        regardless if :func:`endFrame` was called late.
        """
        return self.c_data.CompositorFrameIndex

    @property
    def compositorDroppedFrameCount(self):
        """Number of frames dropped by the compositor. This can happen
        spontaneously for reasons not related to application performance.
        """
        return self.c_data.CompositorDroppedFrameCount

    @property
    def compositorLatency(self):
        """Motion-to-photon latency of the compositor, which include the
        latency of 'timewarp' needed to correct for application latency and
        dropped application frames.
        """
        return self.c_data.CompositorLatency

    @property
    def compositorCpuElapsedTime(self):
        """Time in seconds the compositor spends on the CPU."""
        return self.c_data.CompositorCpuElapsedTime

    @property
    def compositorGpuElapsedTime(self):
        """Time in seconds the compositor spends on the GPU."""
        return self.c_data.CompositorGpuElapsedTime

    @property
    def compositorCpuStartToGpuEndElapsedTime(self):
        """Time in seconds between the point the compositor executes and
        completes distortion/timewarp. Value is -1.0 if GPU time is not
        available.
        """
        return self.c_data.CompositorCpuStartToGpuEndElapsedTime

    @property
    def compositorGpuEndToVsyncElapsedTime(self):
        """Time in seconds left between the compositor is complete and the
        target vertical synchronization (v-sync) on the HMD."""
        return self.c_data.CompositorGpuEndToVsyncElapsedTime

    @property
    def timeToVsync(self):
        """Total time elapsed from when CPU control is handed off to the
        compositor to HMD vertical synchronization signal (V-Sync).

        """
        return self.c_data.CompositorCpuStartToGpuEndElapsedTime + \
            self.c_data.CompositorGpuEndToVsyncElapsedTime

    @property
    def aswIsActive(self):
        """``True`` if Asynchronous Space Warp (ASW) was active this frame."""
        return self.c_data.AswIsActive == capi.ovrTrue

    @property
    def aswActivatedToggleCount(self):
        """How many frames ASW activated during the runtime of this application.
        """
        return self.c_data.AswActivatedToggleCount

    @property
    def aswPresentedFrameCount(self):
        """Number of frames the compositor extrapolated using ASW."""
        return self.c_data.AswPresentedFrameCount

    @property
    def aswFailedFrameCount(self):
        """Number of frames the compositor failed to present extrapolated frames
        using ASW.
        """
        return self.c_data.AswFailedFrameCount


cdef class LibOVRPerfStats(object):
    """Class for frame performance statistics.

    Instances of this class are returned by calling :func:`getPerfStats`.

    """
    cdef capi.ovrPerfStats *c_data
    cdef bint ptr_owner

    cdef LibOVRPerfStatsPerCompositorFrame compFrame0
    cdef LibOVRPerfStatsPerCompositorFrame compFrame1
    cdef LibOVRPerfStatsPerCompositorFrame compFrame2
    cdef LibOVRPerfStatsPerCompositorFrame compFrame3
    cdef LibOVRPerfStatsPerCompositorFrame compFrame4

    def __init__(self):
        """
        Attributes
        ----------
        frameStats : tuple
        frameStatsCount : int
        anyFrameStatsDropped : bool
        adaptiveGpuPerformanceScale : float
        aswIsAvailable : bool
        visibleProcessId : int

        """
        self._new_struct()

    def __cinit__(self):
        self.ptr_owner = False

    @staticmethod
    cdef LibOVRPerfStats fromPtr(capi.ovrPerfStats* ptr, bint owner=False):
        cdef LibOVRPerfStats wrapper = LibOVRPerfStats.__new__(LibOVRPerfStats)

        wrapper.c_data = ptr
        wrapper.ptr_owner = owner

        wrapper.compFrame0 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &wrapper.c_data.FrameStats[0])
        wrapper.compFrame1 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &wrapper.c_data.FrameStats[1])
        wrapper.compFrame2 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &wrapper.c_data.FrameStats[2])
        wrapper.compFrame3 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &wrapper.c_data.FrameStats[3])
        wrapper.compFrame4 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &wrapper.c_data.FrameStats[4])

        return wrapper

    cdef void _new_struct(self):
        if self.c_data is not NULL:
            return

        cdef capi.ovrPerfStats* ptr = \
            <capi.ovrPerfStats*>PyMem_Malloc(
                sizeof(capi.ovrPerfStats))

        if ptr is NULL:
            raise MemoryError

        self.c_data = ptr
        self.ptr_owner = True

        self.compFrame0 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &self.c_data.FrameStats[0])
        self.compFrame1 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &self.c_data.FrameStats[1])
        self.compFrame2 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &self.c_data.FrameStats[2])
        self.compFrame3 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &self.c_data.FrameStats[3])
        self.compFrame4 = LibOVRPerfStatsPerCompositorFrame.fromPtr(
            &self.c_data.FrameStats[4])

    def __dealloc__(self):
        # don't do anything crazy like set c_data=NULL without deallocating!
        if self.c_data is not NULL:
            if self.ptr_owner is True:
                PyMem_Free(self.c_data)
                self.c_data = NULL

    @property
    def frameStats(self):
        """Performance stats per compositor frame. Statistics are in reverse
        chronological order where the first index is the most recent. Only
        indices 0 to :py:attr:`LibOVRPerfStats.frameStatsCount` are valid.
        """
        return (self.compFrame0,
                self.compFrame1,
                self.compFrame2,
                self.compFrame3,
                self.compFrame4)

    @property
    def frameStatsCount(self):
        """Number of compositor frame statistics available. The maximum number
        of frame statistics is 5. If 1 is returned, the application is calling
        :func:`getFrameStats` at a rate equal to or greater than the refresh
        rate of the display.
        """
        return self.c_data.FrameStatsCount

    @property
    def anyFrameStatsDropped(self):
        """``True`` if compositor frame statistics have been dropped. This
        occurs if :func:`getPerfStats` is called at a rate less than 1/5th the
        refresh rate of the HMD. You can obtain the refresh rate for your model
        of HMD by calling :func:`getHmdInfo` and accessing the
        :py:attr:`LibOVRHmdInfo.refreshRate` field of the returned
        :py:class:`LibOVRHmdInfo` instance.

        """
        return self.c_data.AnyFrameStatsDropped == capi.ovrTrue

    @property
    def adaptiveGpuPerformanceScale(self):
        """Adaptive performance scale value. This value ranges between 0.0 and
        1.0. If the application is taking up too many GPU resources, this value
        will be less than 1.0, indicating the application needs to throttle GPU
        usage somehow to maintain performance. If the value is 1.0, the GPU is
        being utilized the correct amount for the application.

        """
        return self.c_data.AdaptiveGpuPerformanceScale

    @property
    def aswIsAvailable(self):
        """``True`` is ASW is enabled."""
        return self.c_data.AswIsAvailable == capi.ovrTrue

    @property
    def visibleProcessId(self):
        """Visible process ID.

        Since performance stats can be obtained for any application running on
        the LibOVR runtime that has focus, this value should equal the current
        process ID returned by ``os.getpid()`` to ensure the statistics returned
        are for the current application.

        Examples
        --------
        Check if frame statistics are for the present PsychXR application::

            perfStats = getPerfStats()
            if perfStats.visibleProcessId == os.getpid():
                # has focus, performance stats are for this application

        """
        return <int>self.c_data.VisibleProcessId


cdef class LibOVRHapticsInfo(object):
    """Class for touch haptics engine information.

    """
    cdef capi.ovrTouchHapticsDesc c_data

    def __init__(self):
        """
        Attributes
        ----------
        sampleRateHz : int
        sampleTime : float
        sampleSizeInBytes : int
        queueMinSizeToAvoidStarvation : int
        submitMinSamples : int
        submitMaxSamples : int
        submitOptimalSamples : int
        """
        pass

    def __cinit__(self):
        pass

    @property
    def sampleRateHz(self):
        """Haptics engine frequency/sample-rate."""
        return self.c_data.SampleRateHz

    @property
    def sampleTime(self):
        """Time in seconds per sample. You can compute the total playback time
        of a haptics buffer with the formula ``sampleTime * samplesCount``.

        """
        return <float>1.0 / <float>self.c_data.SampleRateHz

    @property
    def queueMinSizeToAvoidStarvation(self):
        """Queue size required to prevent starving the haptics engine."""
        return self.c_data.QueueMinSizeToAvoidStarvation

    @property
    def submitMinSamples(self):
        """Minimum number of samples that can be sent to the haptics engine."""
        return self.c_data.SubmitMinSamples

    @property
    def submitMaxSamples(self):
        """Maximum number of samples that can be sent to the haptics engine."""
        return self.c_data.SubmitMinSamples

    @property
    def submitOptimalSamples(self):
        """Optimal number of samples for the haptics engine."""
        return self.c_data.SubmitMinSamples


cdef class LibOVRHapticsBuffer(object):
    """Class for haptics buffer data for controller vibration.

    Instances of this class store a buffer of vibration amplitude values which
    can be passed to the haptics engine for playback using the
    :func:`submitControllerVibration` function. Samples are stored as a 1D array
    of 32-bit floating-point values ranging between 0.0 and 1.0, with a maximum
    length of ``HAPTICS_BUFFER_SAMPLES_MAX - 1``. You can access this buffer
    through the :py:attr:`~LibOVRHapticsBuffer.samples` attribute.

    One can use `Numpy` functions to generate samples for the haptics buffer.
    Here is an example were amplitude ramps down over playback::

        samples = np.linspace(
            1.0, 0.0, num=HAPTICS_BUFFER_SAMPLES_MAX-1, dtype=np.float32)
        hbuff = LibOVRHapticsBuffer(samples)
        # vibrate right Touch controller
        submitControllerVibration(CONTROLLER_TYPE_RTOUCH, hbuff)

    For information about the haptics engine, such as sampling frequency, call
    :func:`getHapticsInfo` and inspect the returned
    :py:class:`LibOVRHapticsInfo` object.

    Parameters
    ----------
    buffer : array_like
        Buffer of samples. Must be a 1D array of floating point values between
        0.0 and 1.0. If an `ndarray` with dtype `float32` is specified, the
        buffer will be set without copying.

    """
    cdef capi.ovrHapticsBuffer c_data
    cdef np.ndarray _samples

    def __init__(self, object buffer):
        """
        Attributes
        ----------
        samples : ndarray
        samplesCount : int

        """
        pass

    def __cinit__(self, object buffer):
        cdef np.ndarray[np.float32_t, ndim=1] array_in = \
            np.asarray(buffer, dtype=np.float32)

        if array_in.ndim > 1:
            raise ValueError(
                "Array has invalid number of dimensions, must be 1.")

        cdef int num_samples = <int>array_in.shape[0]
        if num_samples >= capi.OVR_HAPTICS_BUFFER_SAMPLES_MAX:
            raise ValueError(
                "Array too large, must have length < HAPTICS_BUFFER_SAMPLES_MAX")

        # clip values so range is between 0.0 and 1.0
        np.clip(array_in, 0.0, 1.0, out=array_in)

        self._samples = array_in

        # set samples buffer data
        self.c_data.Samples = <void*>self._samples.data
        self.c_data.SamplesCount = num_samples
        self.c_data.SubmitMode = capi.ovrHapticsBufferSubmit_Enqueue

    @property
    def samples(self):
        """Haptics buffer samples. Each sample specifies the amplitude of
        vibration at a given point of playback. Must have a length less than
        ``HAPTICS_BUFFER_SAMPLES_MAX``.

        Warnings
        --------
        Do not change the value of `samples` during haptic buffer playback. This
        may crash the application. Check the playback status of the haptics
        engine before setting the array.

        """
        return self._samples

    @samples.setter
    def samples(self, object value):
        cdef np.ndarray[np.float32_t, ndim=1] array_in = \
            np.asarray(value, dtype=np.float32)

        if array_in.ndim > 1:
            raise ValueError(
                "Array has invalid number of dimensions, must be 1.")

        cdef int num_samples = <int>array_in.shape[0]
        if num_samples >= capi.OVR_HAPTICS_BUFFER_SAMPLES_MAX:
            raise ValueError(
                "Array too large, must have length < HAPTICS_BUFFER_SAMPLES_MAX")

        # clip values so range is between 0.0 and 1.0
        np.clip(array_in, 0.0, 1.0, out=array_in)

        self._samples = array_in

        # set samples buffer data
        self.c_data.Samples = <void*>self._samples.data
        self.c_data.SamplesCount = num_samples

    @property
    def samplesCount(self):
        """Number of haptic buffer samples stored. This value will always be
        less than ``HAPTICS_BUFFER_SAMPLES_MAX``.

        """
        return self.c_data.SamplesCount


# ------------------------------------------------------------------------------
# Functions
#

def success(int result):
    """Check if an API return indicates success.

    Returns
    -------
    bool
        ``True`` if API call was an successful (`result` > 0).

    """
    return <bint>capi.OVR_SUCCESS(result)


def unqualifiedSuccess(int result):
    """Check if an API return indicates unqualified success.

    Returns
    -------
    bool
        ``True`` if API call was an unqualified success (`result` == 0).

    """
    return <bint>capi.OVR_UNQUALIFIED_SUCCESS(result)


def failure(int result):
    """Check if an API return indicates failure (error).

    Returns
    -------
    bool
        ``True`` if API call returned an error (`result` < 0).

    """
    return <bint>capi.OVR_FAILURE(result)


def getBool(bytes propertyName, bint defaultVal=False):
    """Read a LibOVR boolean property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to get.
    defaultVal : bool, optional
        Return value if the property could not be set. The default value is
        ``False``.

    Returns
    -------
    bool
        Value of the property. Returns `defaultVal` if the property does not
        exist.

    """
    global _ptrSession
    cdef capi.ovrBool val = capi.ovrTrue if defaultVal else capi.ovrFalse

    cdef capi.ovrBool to_return = capi.ovr_GetBool(
        _ptrSession,
        propertyName,
        defaultVal)

    return to_return == capi.ovrTrue


def setBool(bytes propertyName, bint value=True):
    """Write a LibOVR boolean property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to set.
    value : bool
        Value to write.

    Returns
    -------
    bool
        ``True`` if the property was set successfully, ``False`` if the property
        was read-only or does not exist.

    """
    global _ptrSession
    cdef capi.ovrBool val = capi.ovrTrue if value else capi.ovrFalse

    cdef capi.ovrBool to_return = capi.ovr_SetBool(
        _ptrSession,
        propertyName,
        val)

    return to_return == capi.ovrTrue


def getInt(bytes propertyName, int defaultVal=0):
    """Read a LibOVR integer property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to get.
    defaultVal : int, optional
        Return value if the property could not be set.

    Returns
    -------
    int
        Value of the property. Returns `defaultVal` if the property does not
        exist.

    """
    global _ptrSession

    cdef int to_return = capi.ovr_GetInt(
        _ptrSession,
        propertyName,
        defaultVal)

    return to_return


def setInt(bytes propertyName, int value):
    """Write a LibOVR integer property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to set.
    value : int
        Value to write.

    Returns
    -------
    bool
        ``True`` if the property was set successfully, ``False`` if the property
        was read-only or does not exist.

    Examples
    --------

    Set the performance HUD mode to show summary information::

        setInt(PERF_HUD_MODE, PERF_HUD_PERF_SUMMARY)

    Switch off the performance HUD::

        setInt(PERF_HUD_MODE, PERF_OFF)

    """
    global _ptrSession

    cdef capi.ovrBool to_return = capi.ovr_SetInt(
        _ptrSession,
        propertyName,
        value)

    return to_return == capi.ovrTrue


def getFloat(bytes propertyName, float defaultVal=0.0):
    """Read a LibOVR floating point number property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to get.
    defaultVal : float, optional
        Return value if the property could not be set. Returns 0.0 if not
        specified.

    Returns
    -------
    float
        Value of the property. Returns `defaultVal` if the property does not
        exist.

    """
    global _ptrSession

    cdef float to_return = capi.ovr_GetFloat(
        _ptrSession,
        propertyName,
        defaultVal)

    return to_return


def setFloat(bytes propertyName, float value):
    """Write a LibOVR floating point number property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to set.
    value : float
        Value to write.

    Returns
    -------
    bool
        ``True`` if the property was set successfully, ``False`` if the property
        was read-only or does not exist.

    """
    global _ptrSession

    cdef capi.ovrBool to_return = capi.ovr_SetFloat(
        _ptrSession,
        propertyName,
        value)

    return to_return == capi.ovrTrue


def setFloatArray(bytes propertyName, np.ndarray[np.float32_t, ndim=1] values):
    """Write a LibOVR floating point number property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to set.
    values : ndarray
        Value to write, must be 1-D and have dtype=float32.

    Returns
    -------
    bool
        ``True`` if the property was set successfully, ``False`` if the property
        was read-only or does not exist.

    Examples
    --------

    Set the position of the stereo debug guide::

        guidePos = numpy.asarray([0., 0., -10.0], dtype=np.float32)
        setFloatArray(DEBUG_HUD_STEREO_GUIDE_POSITION, guidePos)

    """
    global _ptrSession

    cdef Py_ssize_t valuesCapacity = len(values)
    cdef capi.ovrBool to_return = capi.ovr_SetFloatArray(
        _ptrSession,
        propertyName,
        &values[0],
        <unsigned int>valuesCapacity)

    return to_return == capi.ovrTrue


def getFloatArray(bytes propertyName, np.ndarray[np.float32_t, ndim=1] values not None):
    """Read a LibOVR float array property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to get.
    values : ndarray
        Output array array for values, must be 1-D and have dtype=float32.

    Returns
    -------
    int
        Number of values successfully read from the property.

    Examples
    --------

    Get the position of the stereo debug guide::

        guidePos = numpy.zeros((3,), dtype=np.float32)  # array to write to
        result = getFloatArray(DEBUG_HUD_STEREO_GUIDE_POSITION, guidePos)

        # check if the array we specified was long enough to store the values
        if result <= len(guidePos):
            # success

    """
    global _ptrSession

    cdef Py_ssize_t valuesCapacity = len(values)
    cdef unsigned int to_return = capi.ovr_GetFloatArray(
        _ptrSession,
        propertyName,
        &values[0],
        <unsigned int>valuesCapacity)

    return to_return


def setString(bytes propertyName, object value):
    """Write a LibOVR floating point number property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to set.
    value : str or bytes
        Value to write.

    Returns
    -------
    bool
        ``True`` if the property was set successfully, ``False`` if the property
        was read-only or does not exist.

    """
    global _ptrSession

    cdef object value_in = None
    if isinstance(value, str):
        value_in = value.encode('UTF-8')
    elif isinstance(value, bytes):
        value_in = value
    else:
        raise TypeError("Default value must be type 'str' or 'bytes'.")

    cdef capi.ovrBool to_return = capi.ovr_SetString(
        _ptrSession,
        propertyName,
        value_in)

    return to_return == capi.ovrTrue


def getString(bytes propertyName, object defaultVal=''):
    """Read a LibOVR string property.

    Parameters
    ----------
    propertyName : bytes
        Name of the property to get.
    defaultVal : bytes, optional
        Return value if the property could not be set. Returns 0.0 if not
        specified.

    Returns
    -------
    str
        Value of the property. Returns `defaultVal` if the property does not
        exist.

    Notes
    -----

    * Strings passed to this function are converted to bytes before being passed
      to ``OVR::ovr_GetString``.

    """
    global _ptrSession

    cdef object value_in = None
    if isinstance(defaultVal, str):
        value_in = defaultVal.encode('UTF-8')
    elif isinstance(defaultVal, bytes):
        value_in = defaultVal
    else:
        raise TypeError("Default value must be type 'str' or 'bytes'.")

    cdef const char* to_return = capi.ovr_GetString(
        _ptrSession,
        propertyName,
        value_in)

    return to_return.decode('UTF-8')


def isOculusServiceRunning(int timeoutMs=100):
    """Check if the Oculus Runtime is loaded and running.

    Parameters
    ----------
    timeoutMS : int
        Timeout in milliseconds.

    Returns
    -------
    bool
        True if the Oculus background service is running.

    """
    cdef capi.ovrDetectResult result = capi.ovr_Detect(
        timeoutMs)

    return <bint>result.IsOculusServiceRunning


def isHmdConnected(int timeoutMs=100):
    """Check if an HMD is connected.

    Parameters
    ----------
    timeoutMs : int
        Timeout in milliseconds.

    Returns
    -------
    bool
        True if a LibOVR compatible HMD is connected.

    """
    cdef capi.ovrDetectResult result = capi.ovr_Detect(
        timeoutMs)

    return <bint>result.IsOculusHMDConnected


def getHmdInfo():
    """Get HMD information.

    Returns
    -------
    LibOVRHmdInfo
        HMD information.

    """
    global _hmdDesc
    cdef LibOVRHmdInfo toReturn = LibOVRHmdInfo()
    toReturn.c_data[0] = _hmdDesc

    return toReturn


def initialize(bint focusAware=False, int connectionTimeout=0, object logCallback=None):
    """Initialize the session.

    Parameters
    ----------
    focusAware : bool, optional
        Client is focus aware.
    connectionTimeout : bool, optional
        Timeout in milliseconds for connecting to the server.
    logCallback : object, optional
        Python callback function for logging. May be called at anytime from
        any thread until :func:`shutdown` is called. Function must accept
        arguments `level` and `message`. Where `level` is passed the logging
        level and `message` the message string. Callbacks message levels can be
        ``LOG_LEVEL_DEBUG``, ``LOG_LEVEL_INFO``, and ``LOG_LEVEL_ERROR``. The
        application can filter messages accordingly.

    Returns
    -------
    int
        Return code of the LibOVR API call ``OVR::ovr_Initialize``. Returns
        ``SUCCESS`` if completed without errors. In the event of an
        error, possible return values are:

        * ``ERROR_INITIALIZE``: Initialization error.
        * ``ERROR_LIB_LOAD``:  Failed to load LibOVRRT.
        * ``ERROR_LIB_VERSION``:  LibOVRRT version incompatible.
        * ``ERROR_SERVICE_CONNECTION``:  Cannot connect to OVR service.
        * ``ERROR_SERVICE_VERSION``: OVR service version is incompatible.
        * ``ERROR_INCOMPATIBLE_OS``: Operating system version is incompatible.
        * ``ERROR_DISPLAY_INIT``: Unable to initialize the HMD.
        * ``ERROR_SERVER_START``:  Cannot start a server.
        * ``ERROR_REINITIALIZATION``: Reinitialized with a different version.

    Examples
    --------
    Passing a callback function for logging::

        def myLoggingCallback(level, message):
            level_text = {
                LOG_LEVEL_DEBUG: '[DEBUG]:',
                LOG_LEVEL_INFO: '[INFO]:',
                LOG_LEVEL_ERROR: '[ERROR]:'}

            # print message like '[INFO]: IAD changed to 62.1mm'
            print(level_text[level], message)

        result = initialize(logCallback=myLoggingCallback)

    """
    cdef int32_t flags = capi.ovrInit_RequestVersion
    if focusAware is True:
        flags |= capi.ovrInit_FocusAware

    #if debug is True:
    #    flags |= capi.ovrInit_Debug
    global _initParams
    _initParams.Flags = flags
    _initParams.RequestedMinorVersion = capi.OVR_MINOR_VERSION

    if logCallback is not None:
        _initParams.LogCallback = <capi.ovrLogCallback>LibOVRLogCallback
        _initParams.UserData = <uintptr_t>(<void*>logCallback)
    else:
        _initParams.LogCallback = NULL

    _initParams.ConnectionTimeoutMS = <uint32_t>connectionTimeout
    cdef capi.ovrResult result = capi.ovr_Initialize(
        &_initParams)

    return result  # failed to initalize, return error code


def create():
    """Create a new session. Control is handed over to the application from
    Oculus Home.

    Starting a session will initialize and create a new session. Afterwards
    API functions will return valid values. You can only create one session per
    interpreter thread. All other files/modules within the same thread which
    import PsychXR make API calls to the same session after `create` is called.

    Returns
    -------
    int
        Result of the ``OVR::ovr_Create`` API call. A session was successfully
        created if the result is ``SUCCESS``.

    """
    global _ptrSession
    global _gfxLuid
    global _eyeLayer
    global _hmdDesc
    global _eyeRenderDesc

    result = capi.ovr_Create(&_ptrSession, &_gfxLuid)
    check_result(result)
    if capi.OVR_FAILURE(result):
        return result  # failed to create session, return error code

    # if we got to this point, everything should be fine
    # get HMD descriptor
    _hmdDesc = capi.ovr_GetHmdDesc(_ptrSession)

    # configure the eye render descriptor to use the recommended FOV, this
    # can be changed later
    cdef Py_ssize_t i = 0
    for i in range(capi.ovrEye_Count):
        _eyeRenderDesc[i] = capi.ovr_GetRenderDesc(
            _ptrSession,
            <capi.ovrEyeType>i,
            _hmdDesc.DefaultEyeFov[i])

        _eyeLayer.Fov[i] = _eyeRenderDesc[i].Fov

    return result


def checkSessionStarted():
    """Check of a session has been created.

    This value should return `True` between calls of :func:`create` and
    :func:`destroy`. You can use this to determine if you can make API calls
    which require an active session.

    Returns
    -------
    bool
        `True` if a session is present.

    """
    return _ptrSession != NULL


def destroyTextureSwapChain(int swapChain):
    """Destroy a texture swap chain.

    Once destroyed, the swap chain's resources will be freed.

    Parameters
    ----------
    swapChain : int
        Swap chain identifier/index.

    """
    global _ptrSession
    global _swapChains
    capi.ovr_DestroyTextureSwapChain(_ptrSession, _swapChains[swapChain])
    _swapChains[swapChain] = NULL


def destroyMirrorTexture():
    """Destroy the mirror texture.
    """
    global _ptrSession
    global _mirrorTexture
    if _mirrorTexture != NULL:
        capi.ovr_DestroyMirrorTexture(_ptrSession, _mirrorTexture)


def destroy():
    """Destroy a session.

    Must be called after every successful :func:`create` call. Calling destroy
    will invalidate the current session and all resources must be freed and
    re-created.

    """
    global _ptrSession
    global _eyeLayer
    # null eye textures in eye layer
    _eyeLayer.ColorTexture[0] = _eyeLayer.ColorTexture[1] = NULL

    # destroy the current session and shutdown
    capi.ovr_Destroy(_ptrSession)
    _ptrSession = NULL


def shutdown():
    """End the current session.

    Clean-up routines are executed that destroy all swap chains and mirror
    texture buffers, afterwards control is returned to Oculus Home. This
    must be called after every successful :func:`initialize` call.

    """
    capi.ovr_Shutdown()


def getGraphicsLUID():
    """The graphics device LUID.

    Returns
    -------
    str
        Reserved graphics LUID.

    """
    global _gfxLuid
    return _gfxLuid.Reserved.decode('utf-8')


def setHighQuality(bint enable):
    """Enable high quality mode.

    This enables 4x anisotropic sampling by the compositor to reduce the
    appearance of high-frequency artifacts in the visual periphery due to
    distortion.

    Parameters
    ----------
    enable : bool
        Enable high-quality mode.

    """
    global _eyeLayer
    if enable:
        _eyeLayer.Header.Flags |= capi.ovrLayerFlag_HighQuality
    else:
        _eyeLayer.Header.Flags &= ~capi.ovrLayerFlag_HighQuality


def setHeadLocked(bint enable):
    """Set the render layer state for head locking.

    Head-locking prevents the compositor from applying asynchronous time warp
    (ASW) which compensates for rendering latency. Under normal circumstances
    where head pose data is retrieved from `LibOVR` using
    :func:`getTrackingState` or :func:`getDevicePoses` calls, it
    should be enabled to prevent juddering and improve visual stability.

    However, when using custom head poses (eg. fixed, or from a motion tracker)
    this system may cause the render layer to slip around, as internal IMU data
    will be incongruous with externally supplied head posture data. If you plan
    on passing custom poses to :func:`calcEyePoses`, ensure that head locking is
    enabled.

    Head locking is disabled by default when a session is started.

    Parameters
    ----------
    enable : bool
        Enable head-locking when rendering to the eye render layer.

    """
    global _eyeLayer
    if enable:
        _eyeLayer.Header.Flags |= capi.ovrLayerFlag_HeadLocked
    else:
        _eyeLayer.Header.Flags &= ~capi.ovrLayerFlag_HeadLocked


def isHeadLocked():
    """Check if head locking is enabled.

    Returns
    -------
    bool
        ``True`` if head-locking is enabled.

    See Also
    --------
    setHeadLocked

    """
    return (_eyeLayer.Header.Flags & capi.ovrLayerFlag_HeadLocked) == \
           capi.ovrLayerFlag_HeadLocked


def setReferenceTime(double refTime):
    """Set a reference time to synchronize the time source used by the LibOVR
    driver with an external clock.

    This function computes a time offset between the external clock and the one
    used by the LibOVR driver. The offset is then applied when calling any
    function which requires or retrieves absolute time information (eg.
    :func:`getPredictedDisplayTime`). This is useful for cases where the
    application interfacing with the HMD is using its own time source.

    Parameters
    ----------
    refTime : float
        Current time of the external clock in seconds (must be >=0.0).

    Returns
    -------
    float
        The difference between the external and LibOVR time sources in seconds.

    Notes
    -----
    * If the reference time is changed, any previously reported time will be
      invalid.
    * Allows for some error on the order of a few microseconds when the time
      offset is computed.
    * It is assumed that the an external time source operating on the exact same
      frequency as the time source used by LibOVR.

    """
    global t_offset

    if refTime < 0:
        raise ValueError("Value for `refTime` must be >=0.")

    t_offset = refTime - capi.ovr_GetTimeInSeconds()  # compute the offset

    return t_offset


def getFrameOnsetTime(int frameIndex):
    """Get the estimated frame onset time.

    This function **estimates** the onset time of `frameIndex` by subtracting
    half the display's frequency from the predicted mid-frame display time
    reported by LibOVR.

    Returns
    -------
    float
        Estimated onset time of the next frame in seconds.

    Notes
    -----
    * Onset times are estimated and one should use caution when using the
      value reported by this function.

    """
    global _hmdDesc
    global _ptrSession
    cdef double halfRefresh = (1.0 / <double>_hmdDesc.DisplayRefreshRate) / 2.0

    return capi.ovr_GetPredictedDisplayTime(_ptrSession, frameIndex) - \
           halfRefresh


def getPixelsPerTanAngleAtCenter(int eye):
    """Get pixels per tan angle (=1) at the center of the display.

    Values reflect the FOVs set by the last call to :func:`setEyeRenderFov` (or
    else the default FOVs will be used.)

    Parameters
    ----------
    eye : int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    tuple
        Pixels per tan angle at the center of the screen.

    """
    global _eyeRenderDesc

    cdef capi.ovrVector2f toReturn = \
        _eyeRenderDesc[eye].PixelsPerTanAngleAtCenter

    return toReturn.x, toReturn.y


def getTanAngleToRenderTargetNDC(int eye, object tanAngle):
    """Convert FOV tan angle to normalized device coordinates (NDC).

    Parameters
    ----------
    eye : int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    tanAngle : tuple, list of float or ndarray
        Horizontal and vertical tan angles [X, Y] from display center.

    Returns
    -------
    tuple
        NDC coordinates X, Y [-1, 1].

    """
    global _eyeRenderDesc

    cdef libovr_math.Vector2f vecIn
    vecIn.x = tanAngle[0]
    vecIn.y = tanAngle[1]

    cdef libovr_math.Vector2f toReturn = \
        (<libovr_math.FovPort>_eyeRenderDesc[eye].Fov).TanAngleToRendertargetNDC(
            vecIn)

    return toReturn.x, toReturn.y


def getPixelsPerDegree(int eye):
    """Get pixels per degree at the center of the display.

    Values reflect the FOVs set by the last call to :func:`setEyeRenderFov` (or
    else the default FOVs will be used.)

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    tuple
        Pixels per degree at the center of the screen (h, v).

    """
    global _eyeRenderDesc

    cdef capi.ovrVector2f pixelsPerTanAngle = \
        _eyeRenderDesc[eye].PixelsPerTanAngleAtCenter

    # tan(angle)=1 -> 45 deg
    cdef float horzPixelPerDeg = <float>pixelsPerTanAngle.x / <float>45.0
    cdef float vertPixelPerDeg = <float>pixelsPerTanAngle.y / <float>45.0

    return horzPixelPerDeg, vertPixelPerDeg


def getDistortedViewport(int eye):
    """Get the distorted viewport.

    You must call :func:`setEyeRenderFov` first for values to be valid.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    """
    cdef capi.ovrRecti distVp = _eyeRenderDesc[eye].DistortedViewport

    cdef np.ndarray toReturn = np.asarray([
        distVp.Pos.x,
        distVp.Pos.x,
        distVp.Size.w,
        distVp.Size.h],
        dtype=np.int)

    return toReturn


def getEyeRenderFov(int eye):
    """Get the field-of-view to use for rendering.

    The FOV for a given eye are defined as a tuple of tangent angles (Up,
    Down, Left, Right). By default, this function will return the default
    (recommended) FOVs after :func:`create` is called.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    tuple
        Eye FOV tangent angles [UpTan, DownTan, LeftTan, RightTan], distance to
        near and far clipping planes in meters.

    Examples
    --------
    Getting the tangent angles::

        leftFov, nearClip, farClip = getEyeRenderFOV(EYE_LEFT)
        # left FOV tangent angles, do the same for the right
        upTan, downTan, leftTan, rightTan =  leftFov

    """
    global _eyeRenderDesc
    global _nearClip
    global _farClip

    cdef np.ndarray to_return = np.asarray([
        _eyeRenderDesc[eye].Fov.UpTan,
        _eyeRenderDesc[eye].Fov.DownTan,
        _eyeRenderDesc[eye].Fov.LeftTan,
        _eyeRenderDesc[eye].Fov.RightTan],
        dtype=np.float32)

    return to_return, _nearClip[eye], _farClip[eye]


def setEyeRenderFov(int eye, object fov, float nearClip=0.01, float farClip=1000.):
    """Set the field-of-view of a given eye. This is used to compute the
    projection matrix.

    By default, this function will return the default FOVs after :func:`create`
    is called (see :py:attr:`LibOVRHmdInfo.defaultEyeFov`). You can override
    these values using :py:attr:`LibOVRHmdInfo.maxEyeFov` and
    :py:attr:`LibOVRHmdInfo.symmetricEyeFov`, or with custom values (see
    Examples below).

    Parameters
    ----------
    eye : int
        Eye index. Values are ``EYE_LEFT`` and ``EYE_RIGHT``.
    fov : array_like
        Eye FOV tangent angles [UpTan, DownTan, LeftTan, RightTan].
    nearClip, farClip : float
        Near and far clipping planes in meters. Used when computing the
        projection matrix.

    Examples
    --------

    Setting eye render FOVs to symmetric (needed for mono rendering)::

        leftFov, rightFov = getSymmetricEyeFOVs()
        setEyeRenderFOV(EYE_LEFT, leftFov)
        setEyeRenderFOV(EYE_RIGHT, rightFov)

    Using custom values::

        # Up, Down, Left, Right tan angles
        setEyeRenderFOV(EYE_LEFT, [1.0, -1.0, -1.0, 1.0])

    """
    global _ptrSession
    global _eyeRenderDesc
    global _eyeLayer
    global _nearClip
    global _farClip
    global _eyeProjectionMatrix

    cdef capi.ovrFovPort fov_in
    fov_in.UpTan = <float>fov[0]
    fov_in.DownTan = <float>fov[1]
    fov_in.LeftTan = <float>fov[2]
    fov_in.RightTan = <float>fov[3]

    _eyeRenderDesc[<int>eye] = capi.ovr_GetRenderDesc(
        _ptrSession,
        <capi.ovrEyeType>eye,
        fov_in)

    # set in eye layer too
    _eyeLayer.Fov[eye] = _eyeRenderDesc[eye].Fov

    # set clipping planes
    _nearClip[<int>eye] = nearClip
    _farClip[<int>eye] = farClip

    # compute the projection matrix
    _eyeProjectionMatrix[eye] = \
        <libovr_math.Matrix4f>capi.ovrMatrix4f_Projection(
            _eyeRenderDesc[eye].Fov,
            _nearClip[eye],
            _farClip[eye],
            capi.ovrProjection_ClipRangeOpenGL)


def getEyeAspectRatio(int eye):
    """Get the aspect ratio of an eye.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    float
        Aspect ratio of the eye's FOV (width / height).

    """
    cdef libovr_math.FovPort fovPort = \
        <libovr_math.FovPort>_eyeRenderDesc[eye].Fov

    return (fovPort.LeftTan + fovPort.RightTan) / \
           (fovPort.UpTan + fovPort.DownTan)


def getEyeHorizontalFovRadians(int eye):
    """Get the angle of the horizontal field-of-view (FOV) for a given eye.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    float
        Horizontal FOV of a given eye in radians.

    """
    cdef libovr_math.FovPort fovPort = \
        <libovr_math.FovPort>_eyeRenderDesc[eye].Fov

    return fovPort.GetHorizontalFovRadians()


def getEyeVerticalFovRadians(int eye):
    """Get the angle of the vertical field-of-view (FOV) for a given eye.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    float
        Vertical FOV of a given eye in radians.

    """
    cdef libovr_math.FovPort fovPort = \
        <libovr_math.FovPort>_eyeRenderDesc[eye].Fov

    return fovPort.GetVerticalFovRadians()


def getEyeFocalLength(int eye):
    """Get the focal length of the eye's frustum.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    float
        Focal length in meters.

    Notes
    -----
    * This does not reflect the optical focal length of the HMD.

    """
    return 1.0 / tan(getEyeHorizontalFovRadians(eye) / 2.0)


def calcEyeBufferSize(int eye, float texelsPerPixel=1.0):
    """Get the recommended buffer (texture) sizes for eye buffers.

    Should be called after :func:`setEyeRenderFov`. Returns buffer resolutions in
    pixels (w, h). The values can be used when configuring a framebuffer or swap
    chain for rendering.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    texelsPerPixel : float, optional
        Display pixels per texture pixels at the center of the display. Use a
        value less than 1.0 to improve performance at the cost of resolution.
        Specifying a larger texture is possible, but not recommended by the
        manufacturer.

    Returns
    -------
    tuple
        Buffer widths and heights (w, h) for each eye.

    Examples
    --------

    Getting the buffer size for the swap chain::

        # get HMD info
        hmdInfo = getHmdInfo()

        # eye FOVs must be set first!
        leftFov, rightFov = hmdInfo.defaultEyeFov
        setEyeRenderFov(EYE_LEFT, leftFov)
        setEyeRenderFov(EYE_RIGHT, rightFov)

        leftBufferSize, rightBufferSize = calcEyeBufferSize()
        leftW leftH = leftBufferSize
        rightW, rightH = rightBufferSize
        # combined size if using a single texture buffer for both eyes
        bufferW, bufferH = leftW + rightW, max(leftH, rightH)

        # create a swap chain
        createTextureSwapChainGL(TEXTURE_SWAP_CHAIN0, bufferW, bufferH)

    Notes
    -----
    * This function returns the recommended texture resolution for a specified
      eye. If you are using a single buffer for both eyes, that buffer should be
      as wide as the combined width of both eye's values.

    """
    global _ptrSession
    global _eyeRenderDesc

    cdef capi.ovrSizei bufferSize = capi.ovr_GetFovTextureSize(
        _ptrSession,
        <capi.ovrEyeType>0,
        _eyeRenderDesc[0].Fov,
        <float>texelsPerPixel)

    return bufferSize.w, bufferSize.h


def getLayerEyeFovFlags():
    """Get header flags for the render layer.

    Returns
    -------
    unsigned int
        Flags from ``OVR::ovrLayerEyeFov.Header.Flags``.

    See Also
    --------
    setLayerEyeFovFlags : Set layer flags.

    Examples
    --------
    Check if a flag is set::

        layerFlags = getLayerEyeFovFlags()
        if (layerFlags & LAYER_FLAG_HIGH_QUALITY) == LAYER_FLAG_HIGH_QUALITY:
            print('high quality enabled!')

    """
    global _eyeLayer
    return <unsigned int>_eyeLayer.Header.Flags


def setLayerEyeFovFlags(unsigned int flags):
    """Set header flags for the render layer.

    Parameters
    ----------
    flags : int
        Flags to set. Flags can be ORed together to apply multiple settings.
        Valid values for flags are:

        * ``LAYER_FLAG_HIGH_QUALITY`` : Enable high quality mode which tells the
          compositor to use 4x anisotropic filtering when sampling.
        * ``LAYER_FLAG_TEXTURE_ORIGIN_AT_BOTTOM_LEFT`` : Tell the compositor the
          texture origin is at the bottom left, required for using OpenGL
          textures.
        * ``LAYER_FLAG_HEAD_LOCKED`` : Enable head locking, which forces the
          render layer transformations to be head referenced.

    See Also
    --------
    getLayerEyeFovFlags : Get layer flags.

    Notes
    -----
    * ``LAYER_FLAG_HIGH_QUALITY`` and
      ``LAYER_FLAG_TEXTURE_ORIGIN_AT_BOTTOM_LEFT`` are recommended settings and
      are enabled by default.

    Examples
    --------
    Enable head-locked mode::

        layerFlags = getLayerEyeFovFlags()  # get current flags
        layerFlags |= LAYER_FLAG_HEAD_LOCKED  # set head-locking
        setLayerEyeFovFlags(layerFlags)  # set the flags again

    """
    global _eyeLayer
    _eyeLayer.Header.Flags = <capi.ovrLayerFlags>flags


def createTextureSwapChainGL(int swapChain, int width, int height, int textureFormat=FORMAT_R8G8B8A8_UNORM_SRGB, int levels=1):
    """Create a texture swap chain for eye image buffers.

    Parameters
    ----------
    swapChain : int
        Swap chain handle to initialize, usually :data:`SWAP_CHAIN*`.
    width : int
        Width of texture in pixels.
    height : int
        Height of texture in pixels.
    textureFormat : int
        Texture format to use. Valid color texture formats are:

        * ``FORMAT_R8G8B8A8_UNORM``
        * ``FORMAT_R8G8B8A8_UNORM_SRGB``
        * ``FORMAT_R16G16B16A16_FLOAT``
        * ``FORMAT_R11G11B10_FLOAT``

        Depth texture formats:

        * ``FORMAT_D16_UNORM``
        * ``FORMAT_D24_UNORM_S8_UINT``
        * ``FORMAT_D32_FLOAT``

    Other Parameters
    ----------------
    levels : int
        Mip levels to use, default is 1.

    Returns
    -------
    int
        The result of the ``OVR::ovr_CreateTextureSwapChainGL`` API call.

    Examples
    --------

    Create a texture swap chain::

        result = createTextureSwapChainGL(TEXTURE_SWAP_CHAIN0,
            texWidth, texHeight, FORMAT_R8G8B8A8_UNORM)
        # set the swap chain for each eye buffer
        for eye in range(EYE_COUNT):
            setEyeColorTextureSwapChain(eye, TEXTURE_SWAP_CHAIN0)

    """
    global _swapChains
    global _ptrSession

    if _swapChains[swapChain] != NULL:
        raise ValueError("Swap chain TEXTURE_SWAP_CHAIN{} already "
                         "initialized!".format(swapChain))

    # configure the texture
    cdef capi.ovrTextureSwapChainDesc swapConfig
    swapConfig.Type = capi.ovrTexture_2D
    swapConfig.Format = <capi.ovrTextureFormat>textureFormat
    swapConfig.ArraySize = 1
    swapConfig.Width = <int>width
    swapConfig.Height = <int>height
    swapConfig.MipLevels = <int>levels
    swapConfig.SampleCount = 1
    swapConfig.StaticImage = capi.ovrFalse  # always buffered
    swapConfig.MiscFlags = capi.ovrTextureMisc_None
    swapConfig.BindFlags = capi.ovrTextureBind_None

    # create the swap chain
    cdef capi.ovrResult result = \
        capi.ovr_CreateTextureSwapChainGL(
            _ptrSession,
            &swapConfig,
            &_swapChains[swapChain])

    #_eyeLayer.ColorTexture[swapChain] = _swapChains[swapChain]

    return result


def getTextureSwapChainLengthGL(int swapChain):
    """Get the length of a specified swap chain.

    Parameters
    ----------
    swapChain : int
        Swap chain handle to query. Must be a swap chain initialized by a
        previous call to :func:`createTextureSwapChainGL`.

    Returns
    -------
    tuple of int
        Result of the ``ovr_GetTextureSwapChainLength`` API call and the
        length of that swap chain.

    See Also
    --------
    getTextureSwapChainCurrentIndex : Get the current swap chain index.
    getTextureSwapChainBufferGL : Get the current OpenGL swap chain buffer.

    Examples
    --------

    Get the swap chain length for the previously created
    ``TEXTURE_SWAP_CHAIN0``::

        result, length = getTextureSwapChainLengthGL(TEXTURE_SWAP_CHAIN0)

    """
    cdef int outLength
    cdef capi.ovrResult result = 0
    global _swapChains
    global _ptrSession
    global _eyeLayer

    # check if there is a swap chain in the slot
    if _eyeLayer.ColorTexture[swapChain] == NULL:
        raise RuntimeError(
            "Cannot get swap chain length, NULL eye buffer texture.")

    # get the current texture index within the swap chain
    result = capi.ovr_GetTextureSwapChainLength(
        _ptrSession, _swapChains[swapChain], &outLength)

    return result, outLength


def getTextureSwapChainCurrentIndex(int swapChain):
    """Get the current buffer index within the swap chain.

    Parameters
    ----------
    swapChain : int
        Swap chain handle to query. Must be a swap chain initialized by a
        previous call to :func:`createTextureSwapChainGL`.

    Returns
    -------
    tuple of int
        Result of the ``OVR::ovr_GetTextureSwapChainCurrentIndex`` API call and
        the index of the buffer.

    See Also
    --------
    getTextureSwapChainLengthGL : Get the length of a swap chain.
    getTextureSwapChainBufferGL : Get the current OpenGL swap chain buffer.

    """
    cdef int current_idx = 0
    global _swapChains
    global _eyeLayer
    global _ptrSession

    # check if there is a swap chain in the slot
    if _eyeLayer.ColorTexture[swapChain] == NULL:
        raise RuntimeError(
            "Cannot get buffer ID, NULL eye buffer texture.")

    # get the current texture index within the swap chain
    cdef capi.ovrResult result = capi.ovr_GetTextureSwapChainCurrentIndex(
        _ptrSession, _swapChains[swapChain], &current_idx)

    return result, current_idx


def getTextureSwapChainBufferGL(int swapChain, int index):
    """Get the texture buffer as an OpenGL name at a specific index in the
    swap chain for a given swapChain.

    Parameters
    ----------
    swapChain : int
        Swap chain handle to query. Must be a swap chain initialized by a
        previous call to :func:`createTextureSwapChainGL`.
    index : int
        Index within the swap chain to retrieve its OpenGL texture name.

    Returns
    -------
    tuple (int, int)
        Result of the ``OVR::ovr_GetTextureSwapChainBufferGL`` API call and the
        OpenGL texture buffer name. A OpenGL buffer name is invalid when 0,
        check the returned API call result for an error condition.

    Examples
    --------

    Get the OpenGL texture buffer name associated with the swap chain index::

        # get the current available index
        swapChain = TEXTURE_SWAP_CHAIN0
        result, currentIdx = getSwapChainCurrentIndex(swapChain)

        # get the OpenGL buffer name
        result, texId = getTextureSwapChainBufferGL(swapChain, currentIdx)

        # bind the texture
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
            GL_TEXTURE_2D, texId, 0)

    """
    cdef unsigned int tex_id = 0  # OpenGL texture handle
    global _swapChains
    global _eyeLayer
    global _ptrSession

    # get the next available texture ID from the swap chain
    cdef capi.ovrResult result = capi.ovr_GetTextureSwapChainBufferGL(
        _ptrSession, _swapChains[swapChain], index, &tex_id)

    return result, tex_id


def setEyeColorTextureSwapChain(int eye, int swapChain):
    """Set the color texture swap chain for a given eye.

    Should be called after a successful :func:`createTextureSwapChainGL` call
    but before any rendering is done.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    swapChain : int
        Swap chain handle to query. Must be a swap chain initialized by a
        previous call to :func:`createTextureSwapChainGL`.

    See Also
    --------
    createTextureSwapChainGL : Create a OpenGL buffer swap chain.

    Examples
    --------

    Associate the swap chain with both eyes (single buffer for stereo views)::

        setEyeColorTextureSwapChain(EYE_LEFT, TEXTURE_SWAP_CHAIN0)
        setEyeColorTextureSwapChain(EYE_RIGHT, TEXTURE_SWAP_CHAIN0)

        # same as above but with a loop
        for eye in range(EYE_COUNT):
            setEyeColorTextureSwapChain(eye, TEXTURE_SWAP_CHAIN0)

    Associate a swap chain with each eye (separate buffer for stereo views)::

        setEyeColorTextureSwapChain(EYE_LEFT, TEXTURE_SWAP_CHAIN0)
        setEyeColorTextureSwapChain(EYE_RIGHT, TEXTURE_SWAP_CHAIN1)

        # with a loop ...
        for eye in range(EYE_COUNT):
            setEyeColorTextureSwapChain(eye, TEXTURE_SWAP_CHAIN0 + eye)

    """
    global _swapChains
    global _eyeLayer

    _eyeLayer.ColorTexture[eye] = _swapChains[swapChain]


def createMirrorTexture(int width, int height, int textureFormat=FORMAT_R8G8B8A8_UNORM_SRGB, int mirrorOptions=MIRROR_OPTION_DEFAULT):
    """Create a mirror texture.

    This displays the content of the rendered images being presented on the
    HMD. The image is automatically refreshed to reflect the current content
    on the display. This displays the post-distortion texture.

    Parameters
    ----------
    width : int
        Width of texture in pixels.
    height : int
        Height of texture in pixels.
    textureFormat : int
        Color texture format to use, valid texture formats are:

        * ``FORMAT_R8G8B8A8_UNORM``
        * ``FORMAT_R8G8B8A8_UNORM_SRGB``
        * ``FORMAT_R16G16B16A16_FLOAT``
        * ``FORMAT_R11G11B10_FLOAT``

    mirrorOptions : int, optional
        Mirror texture options. Specifies how to display the rendered content.
        By default, ``MIRROR_OPTION_DEFAULT`` is used which displays the
        post-distortion image of both eye buffers side-by-side. Other options
        are available by specifying the following flags:

        * ``MIRROR_OPTION_POST_DISTORTION`` - Barrel distorted eye buffer.
        * ``MIRROR_OPTION_LEFT_EYE_ONLY`` and ``MIRROR_OPTION_RIGHT_EYE_ONLY`` -
          show rectilinear images of either the left of right eye. These values
          are mutually exclusive.
        * ``MIRROR_OPTION_INCLUDE_GUARDIAN`` - Show guardian boundary system in
          mirror texture.
        * ``MIRROR_OPTION_INCLUDE_NOTIFICATIONS`` - Show notifications received
          on the mirror texture.
        * ``MIRROR_OPTION_INCLUDE_SYSTEM_GUI`` - Show the system menu when
          accessed via the home button on the controller.
        * ``MIRROR_OPTION_FORCE_SYMMETRIC_FOV`` - Force mirror output to use
          symmetric FOVs. Only valid when ``MIRROR_OPTION_POST_DISTORTION`` is
          not specified.

        Multiple option flags can be combined by using the ``|`` operator and
        passed to `mirrorOptions`. However, some options cannot be used in
        conjunction with each other, if so, this function may return
        ``ERROR_INVALID_PARAMETER``.

    Returns
    -------
    int
        Result of API call ``OVR::ovr_CreateMirrorTextureWithOptionsGL``.

    """
    # create the descriptor
    cdef capi.ovrMirrorTextureDesc mirrorDesc
    global _ptrSession
    global _mirrorTexture

    mirrorDesc.Format = <capi.ovrTextureFormat>textureFormat
    mirrorDesc.Width = <int>width
    mirrorDesc.Height = <int>height
    mirrorDesc.MiscFlags = capi.ovrTextureMisc_None
    mirrorDesc.MirrorOptions = <capi.ovrMirrorOptions>mirrorOptions

    cdef capi.ovrResult result = capi.ovr_CreateMirrorTextureWithOptionsGL(
        _ptrSession, &mirrorDesc, &_mirrorTexture)

    return <int>result


def getMirrorTexture():
    """Mirror texture ID.

    Returns
    -------
    tuple (int, int)
        Result of API call ``OVR::ovr_GetMirrorTextureBufferGL`` and the mirror
        texture ID. A mirror texture ID == 0 is invalid.

    Examples
    --------

    Getting the mirror texture for use::

        # get the mirror texture
        result, mirrorTexId = getMirrorTexture()
        if failure(result):
            # raise error ...

        # bind the mirror texture texture to the framebuffer
        glFramebufferTexture2D(
            GL_READ_FRAMEBUFFER,
            GL_COLOR_ATTACHMENT0,
            GL_TEXTURE_2D, mirrorTexId, 0)

    """
    cdef unsigned int mirror_id

    global _ptrSession
    global _mirrorTexture

    if _mirrorTexture == NULL:  # no texture created
        return None

    cdef capi.ovrResult result = \
        capi.ovr_GetMirrorTextureBufferGL(
            _ptrSession,
            _mirrorTexture,
            &mirror_id)

    return <int>result, <unsigned int>mirror_id


def getSensorSampleTime():
    """Get the sensor sample timestamp.

    The time when the source data used to compute the render pose was sampled.
    This value is used to compute the motion-to-photon latency. This value is
    set when :func:`getDevicePoses` and :func:`setSensorSampleTime` is called.
    If :func:`getTrackingState` was called with `latencyMarker` set, sensor
    sample time will be 0.0.

    Returns
    -------
    float
        Sample timestamp in seconds.

    See Also
    --------
    setSensorSampleTime : Set sensor sample time.

    """
    global _eyeLayer
    return _eyeLayer.SensorSampleTime


def setSensorSampleTime(double absTime):
    """Set the sensor sample timestamp.

    Specify the sensor sample time of the source data used to compute the render
    poses of each eye. This value is used to compute motion-to-photon latency.

    Parameters
    ----------
    absTime : float
        Time in seconds.

    See Also
    --------
    getSensorSampleTime : Get sensor sample time.
    getTrackingState : Get the current tracking state.
    getDevicePoses : Get device poses.

    Examples
    --------
    Supplying sensor sample time from an external tracking source::

        # get sensor time from the mocal system
        sampleTime = timeInSeconds() - mocap.timeSinceMidExposure

        # set sample time
        setSensorSampleTime(sampleTime)
        calcEyePoses(headRigidBody)

        # get frame perf stats after calling `endFrame` to get last frame
        # motion-to-photon latency
        perfStats = getPerfStats()
        m2p_latency = perfStats.frameStats[0].appMotionToPhotonLatency

    """
    global _eyeLayer
    _eyeLayer.SensorSampleTime = absTime


def getTrackingState(double absTime, bint latencyMarker=True):
    """Get the current tracking state of the head and hands.

    Parameters
    ----------
    absTime : float
        Absolute time in seconds which the tracking state refers to.
    latencyMarker : bool
        Insert a latency marker for motion-to-photon calculation.

    Returns
    -------
    LibOVRTrackingState
        Tracking state at `absTime` for head and hands.

    Examples
    --------
    Getting the head pose and calculating eye render poses::

        t = hmd.getPredictedDisplayTime()
        trackingState = hmd.getTrackingState(t)

        # tracking state flags
        flags = STATUS_ORIENTATION_TRACKED | STATUS_ORIENTATION_TRACKED

        # check if tracking
        if (flags & trackingState.statusFlags) == flags:
            hmd.calcEyePose(trackingState.headPose.pose)  # calculate eye poses

    """
    global _ptrSession
    global _eyeLayer

    cdef capi.ovrBool use_marker = \
        capi.ovrTrue if latencyMarker else capi.ovrFalse

    # tracking state object that is actually returned to Python land
    cdef LibOVRTrackingState to_return = LibOVRTrackingState()
    to_return.c_data[0] = capi.ovr_GetTrackingState(
        _ptrSession, absTime, use_marker)

    return to_return


def getDevicePoses(object deviceTypes, double absTime, bint latencyMarker=True):
    """Get tracked device poses.

    Each pose in the returned array matches the device type at each index
    specified in `deviceTypes`. You need to call this function to get the poses
    for 'objects', which are additional Touch controllers that can be paired and
    tracked in the scene.

    It is recommended that :func:`getTrackingState` is used for obtaining the
    head and hand poses.

    Parameters
    ----------
    deviceTypes : list or tuple of int
        List of device types. Valid device types identifiers are:

        * ``TRACKED_DEVICE_TYPE_HMD`` : The head or HMD.
        * ``TRACKED_DEVICE_TYPE_LTOUCH`` : Left touch controller or hand.
        * ``TRACKED_DEVICE_TYPE_RTOUCH`` : Right touch controller or hand.
        * ``TRACKED_DEVICE_TYPE_TOUCH`` : Both touch controllers.

        Up to four additional touch controllers can be paired and tracked, they
        are assigned as:

        * ``TRACKED_DEVICE_TYPE_OBJECT0``
        * ``TRACKED_DEVICE_TYPE_OBJECT1``
        * ``TRACKED_DEVICE_TYPE_OBJECT2``
        * ``TRACKED_DEVICE_TYPE_OBJECT3``

    absTime : float
        Absolute time in seconds poses refer to.
    latencyMarker: bool, optional
        Insert a marker for motion-to-photon latency calculation. Set this to
        False if :func:`getTrackingState` was previously called and a latency
        marker was set there. The latency marker is set to the absolute time
        this function was called.

    Returns
    -------
    tuple
        Return code (`int`) of the ``OVR::ovr_GetDevicePoses`` API call and list 
        of tracked device poses (`list` of :py:class:`LibOVRPoseState`). If a
        device cannot be tracked, the return code will be
        ``ERROR_LOST_TRACKING``.

    Warning
    -------
    If multiple devices were specified with `deviceTypes`, the return code will
    be ``ERROR_LOST_TRACKING`` if ANY of the devices lost tracking.

    Examples
    --------

    Get HMD and touch controller poses::

        deviceTypes = (TRACKED_DEVICE_TYPE_HMD,
                       TRACKED_DEVICE_TYPE_LTOUCH,
                       TRACKED_DEVICE_TYPE_RTOUCH)
        headPose, leftHandPose, rightHandPose = getDevicePoses(
            deviceTypes, absTime)

    """
    # give a success code and empty pose list if an empty list was specified
    global _ptrSession
    global _eyeLayer

    if not deviceTypes:
        if latencyMarker:
            _eyeLayer.SensorSampleTime = capi.ovr_GetTimeInSeconds()
        return capi.ovrSuccess, []

    # allocate arrays to store pose types and poses
    cdef int count = <int>len(deviceTypes)
    cdef capi.ovrTrackedDeviceType* devices = \
        <capi.ovrTrackedDeviceType*>PyMem_Malloc(
            count * sizeof(capi.ovrTrackedDeviceType))
    if not devices:
        raise MemoryError("Failed to allocate array 'devices'.")

    cdef int i = 0
    for i in range(count):
        devices[i] = <capi.ovrTrackedDeviceType>deviceTypes[i]

    cdef capi.ovrPoseStatef* devicePoses = \
        <capi.ovrPoseStatef*>PyMem_Malloc(
            count * sizeof(capi.ovrPoseStatef))
    if not devicePoses:
        raise MemoryError("Failed to allocate array 'devicePoses'.")

    # get the device poses
    cdef capi.ovrResult result = capi.ovr_GetDevicePoses(
        _ptrSession,
        devices,
        count,
        absTime,
        devicePoses)

    # for computing app photon-to-motion latency
    if latencyMarker:
        _eyeLayer.SensorSampleTime = capi.ovr_GetTimeInSeconds()

    # build list of device poses
    cdef list outPoses = list()
    cdef LibOVRPoseState thisPose
    for i in range(count):
        thisPose = LibOVRPoseState()  # new
        thisPose.c_data[0] = devicePoses[i]
        outPoses.append(thisPose)

    # free the allocated arrays
    PyMem_Free(devices)
    PyMem_Free(devicePoses)

    return result, outPoses


def calcEyePoses(LibOVRPose headPose, object originPose=None):
    """Calculate eye poses using a given head pose.

    Eye poses are derived from the specified head pose, relative eye poses, and
    the scene tracking origin.

    Calculated eye poses are stored and passed to the compositor when
    :func:`endFrame` is called unless ``LAYER_FLAG_HEAD_LOCKED`` is set. You can
    access the computed poses via the :func:`getEyeRenderPose` function. If
    using custom head poses, ensure :func:`setHeadLocked` is ``True`` or the
    ``LAYER_FLAG_HEAD_LOCKED`` render layer flag is set.

    Parameters
    ----------
    headPose : :py:class:`LibOVRPose`
        Head pose.
    originPose : :py:class:`LibOVRPose`, optional
        Optional world origin pose to transform head pose. You can apply
        transformations to this pose to simulate movement through a scene.

    Examples
    --------

    Compute the eye poses from tracker data::

        abs_time = getPredictedDisplayTime()
        tracking_state, calibrated_origin = getTrackingState(abs_time, True)
        headPoseState, status = tracking_state[TRACKED_DEVICE_TYPE_HMD]

        # calculate head pose
        hmd.calcEyePoses(headPoseState.pose)

        # computed render poses appear here
        renderPoseLeft, renderPoseRight = hmd.getEyeRenderPoses()

    Using external data to set the head pose from a motion capture system::

        # rigid body in the scene defining the scene origin
        rbHead = LibOVRPose(*headRb.posOri)
        calcEyePoses(rbHead)

    Note that the external tracker latency might be larger than builtin
    tracking. To get around this, enable forward prediction in your mocap
    software to equal roughly to average `getPredictedDisplayTime() -
    mocapMidExposureTime`, or time integrate poses to mid-frame time.

    """
    global _ptrSession
    global _eyeLayer
    global _eyeRenderPoses
    global _eyeRenderDesc
    global _eyeViewMatrix
    global _eyeProjectionMatrix
    global _eyeViewProjectionMatrix

    cdef capi.ovrPosef[2] hmdToEyePoses
    hmdToEyePoses[0] = _eyeRenderDesc[0].HmdToEyePose
    hmdToEyePoses[1] = _eyeRenderDesc[1].HmdToEyePose

    # calculate the eye poses
    capi.ovr_CalcEyePoses2(headPose.c_data[0], hmdToEyePoses, _eyeRenderPoses)

    # compute the eye transformation matrices from poses
    cdef libovr_math.Vector3f pos, originPos
    cdef libovr_math.Quatf ori, originOri
    cdef libovr_math.Vector3f up
    cdef libovr_math.Vector3f forward
    cdef libovr_math.Matrix4f rm

    # get origin pose components
    if originPose is not None:
        originPos = <libovr_math.Vector3f>(<LibOVRPose>originPose).c_data.Position
        originOri = <libovr_math.Quatf>(<LibOVRPose>originPose).c_data.Orientation
        if not originOri.IsNormalized():  # make sure orientation is normalized
            originOri.Normalize()

    cdef int eye = 0
    for eye in range(capi.ovrEye_Count):
        if originPose is not None:
            pos = originPos + <libovr_math.Vector3f>_eyeRenderPoses[eye].Position
            ori = originOri * <libovr_math.Quatf>_eyeRenderPoses[eye].Orientation
        else:
            pos = <libovr_math.Vector3f>_eyeRenderPoses[eye].Position
            ori = <libovr_math.Quatf>_eyeRenderPoses[eye].Orientation

        if not ori.IsNormalized():  # make sure orientation is normalized
            ori.Normalize()

        rm = libovr_math.Matrix4f(ori)
        up = rm.Transform(libovr_math.Vector3f(0., 1., 0.))
        forward = rm.Transform(libovr_math.Vector3f(0., 0., -1.))
        _eyeViewMatrix[eye] = \
            libovr_math.Matrix4f.LookAtRH(pos, pos + forward, up)
        _eyeViewProjectionMatrix[eye] = \
            _eyeProjectionMatrix[eye] * _eyeViewMatrix[eye]


def getHmdToEyePose(int eye):
    """HMD to eye pose.

    These are the prototype eye poses specified by LibOVR, defined only
    after :func:`create` is called. These poses are referenced to the HMD
    origin. Poses are transformed by calling :func:`calcEyePoses`, updating the
    values returned by :func:`getEyeRenderPose`.

    The horizontal (x-axis) separation of the eye poses are determined by the
    configured lens spacing (slider adjustment). This spacing is supposed to
    correspond to the actual inter-ocular distance (IOD) of the user. You can
    get the IOD used for rendering by adding up the absolute values of the
    x-components of the eye poses, or by multiplying the value of
    :func:`getEyeToNoseDist` by two. Furthermore, the IOD values can be altered,
    prior to calling :func`calcEyePoses`, to override the values specified by
    LibOVR.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    tuple (LibOVRPose, LibOVRPose)
        Copy of the HMD to eye pose.

    See Also
    --------
    setHmdToEyePose : Set the HMD to eye pose.

    Examples
    --------
    Get the HMD to eye poses::

        leftPose = getHmdToEyePose(EYE_LEFT)
        rightPose = getHmdToEyePose(EYE_RIGHT)

    """
    global _eyeRenderDesc
    return LibOVRPose.fromPtr(&_eyeRenderDesc[eye].HmdToEyePose)


def setHmdToEyePose(int eye, LibOVRPose eyePose):
    """Set the HMD eye poses.

    This overwrites the values returned by LibOVR and will be used in successive
    calls of :func:`calcEyePoses` to compute eye render poses. Note that the
    poses store the view space translations, not the relative position in the
    scene.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    See Also
    --------
    getHmdToEyePose : Get the current HMD to eye pose.

    Examples
    --------
    Set both HMD to eye poses::

        eyePoses = [LibOVRPose((0.035, 0.0, 0.0)), LibOVRPose((-0.035, 0.0, 0.0))]
        for eye in enumerate(eyePoses):
            setHmdToEyePose(eye, eyePoses[eye])

    """
    global _eyeRenderDesc
    _eyeRenderDesc[0].HmdToEyePose = eyePose.c_data[0]


def getEyeRenderPose(int eye):
    """Get eye render poses.

    Pose are those computed by the last :func:`calcEyePoses` call. Returned
    objects are copies of the data stored internally by the session
    instance. These poses are used to derive the view matrix when rendering
    for each eye, and used for visibility culling.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    Returns
    -------
    tuple (LibOVRPose, LibOVRPose)
        Copies of the HMD to eye poses for the left and right eye.

    See Also
    --------
    setEyeRenderPose : Set an eye's render pose.

    Examples
    --------

    Get the eye render poses::

        leftPose = getHmdToEyePose(EYE_LEFT)
        rightPose = getHmdToEyePose(EYE_RIGHT)

    Get the left and right view matrices::

        eyeViewMatrices = []
        for eye in enumerate(EYE_COUNT):
            eyeViewMatrices.append(getHmdToEyePose(eye).asMatrix())

    Same as above, but overwrites existing view matrices::

        # identity 4x4 matrices
        eyeViewMatrices = [
            numpy.identity(4, dtype=numpy.float32),
            numpy.identity(4, dtype=numpy.float32)]
        for eye in range(EYE_COUNT):
            getHmdToEyePose(eye).asMatrix(eyeViewMatrices[eye])

    """
    global _eyeRenderPoses
    return LibOVRPose.fromPtr(&_eyeRenderPoses[eye])


def setEyeRenderPose(int eye, LibOVRPose eyePose):
    """Set eye render pose.

    Setting the eye render pose will update the values returned by
    :func:`getEyeRenderPose`.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.

    See Also
    --------
    getEyeRenderPose : Get an eye's render pose.

    """
    global _eyeRenderPoses
    global _eyeViewMatrix
    global _eyeProjectionMatrix
    global _eyeViewProjectionMatrix

    _eyeRenderPoses[eye] = eyePose.c_data[0]

    # re-compute the eye transformation matrices from poses
    cdef libovr_math.Vector3f pos
    cdef libovr_math.Quatf ori
    cdef libovr_math.Vector3f up
    cdef libovr_math.Vector3f forward
    cdef libovr_math.Matrix4f rm

    pos = <libovr_math.Vector3f>_eyeRenderPoses[eye].Position
    ori = <libovr_math.Quatf>_eyeRenderPoses[eye].Orientation

    if not ori.IsNormalized():  # make sure orientation is normalized
        ori.Normalize()

    rm = libovr_math.Matrix4f(ori)
    up = rm.Transform(libovr_math.Vector3f(0., 1., 0.))
    forward = rm.Transform(libovr_math.Vector3f(0., 0., -1.))
    _eyeViewMatrix[eye] = \
        libovr_math.Matrix4f.LookAtRH(pos, pos + forward, up)
    # VP matrix
    _eyeViewProjectionMatrix[eye] = \
        _eyeProjectionMatrix[eye] * _eyeViewMatrix[eye]


def getEyeProjectionMatrix(int eye, np.ndarray[np.float32_t, ndim=2] out=None):
    """Compute the projection matrix.

    The projection matrix is computed by the runtime using the eye FOV
    parameters set with :py:attr:`libovr.LibOVRSession.setEyeRenderFov` calls.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    out : `ndarray` or `None`, optional
        Alternative matrix to write values to instead of returning a new one.

    Returns
    -------
    ndarray
        4x4 projection matrix.

    Examples
    --------

    Get the left and right projection matrices as a list::

        eyeProjectionMatrices = []
        for eye in range(EYE_COUNT):
            eyeProjectionMatrices.append(getEyeProjectionMatrix(eye))

    Same as above, but overwrites existing view matrices::

        # identity 4x4 matrices
        eyeProjectionMatrices = [
            numpy.identity(4, dtype=numpy.float32),
            numpy.identity(4, dtype=numpy.float32)]

        # for eye in range(EYE_COUNT) also works
        for eye in enumerate(eyeProjectionMatrices):
            getEyeProjectionMatrix(eye, out=eyeProjectionMatrices[eye])

    Using eye projection matrices with PyOpenGL (fixed-function)::

        P = getEyeProjectionMatrix(eye)
        glMatrixMode(GL.GL_PROJECTION)
        glLoadTransposeMatrixf(P)

    For `Pyglet` (which is the stardard GL interface for `PsychoPy`), you need
    to convert the matrix to a C-types pointer before passing it to
    `glLoadTransposeMatrixf`::

        P = getEyeProjectionMatrix(eye)
        P = P.ctypes.data_as(ctypes.POINTER(ctypes.c_float))
        glMatrixMode(GL.GL_PROJECTION)
        glLoadTransposeMatrixf(P)

    If using fragment shaders, the matrix can be passed on to them as such::

        P = getEyeProjectionMatrix(eye)
        P = P.ctypes.data_as(ctypes.POINTER(ctypes.c_float))

        # after the program was installed in the current rendering state via
        # `glUseProgram` ...
        loc = glGetUniformLocation(program, b"m_Projection")
        glUniformMatrix4fv(loc, 1, GL_TRUE, P)  # `transpose` must be `True`

    """
    global _eyeProjectionMatrix

    cdef np.ndarray[np.float32_t, ndim=2] to_return

    if out is None:
        to_return = np.zeros((4, 4), dtype=np.float32)
    else:
        to_return = out

    # fast copy matrix to numpy array
    cdef float [:, :] mv = to_return
    cdef Py_ssize_t i, j
    cdef Py_ssize_t N = 4
    i = j = 0
    for i in range(N):
        for j in range(N):
            mv[i, j] = _eyeProjectionMatrix[eye].M[i][j]

    return to_return


def getEyeRenderViewport(int eye, np.ndarray[np.int_t, ndim=1] out=None):
    """Get the eye render viewport.

    The viewport defines the region on the swap texture a given eye's image is
    drawn to.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    out : `ndarray`, optional
        Optional NumPy array to place values. If None, this function will return
        a new array. Must be dtype=int and length 4.

    Returns
    -------
    ndarray
        Viewport rectangle [x, y, w, h].

    """
    global _eyeLayer
    cdef np.ndarray[np.int_t, ndim=1] to_return

    if out is None:
        to_return = np.zeros((4,), dtype=np.int)
    else:
        to_return = out

    to_return[0] = _eyeLayer.Viewport[eye].Pos.x
    to_return[1] = _eyeLayer.Viewport[eye].Pos.y
    to_return[2] = _eyeLayer.Viewport[eye].Size.w
    to_return[3] = _eyeLayer.Viewport[eye].Size.h

    return to_return


def setEyeRenderViewport(int eye, object values):
    """Set the eye render viewport.

    The viewport defines the region on the swap texture a given eye's image is
    drawn to.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    values : array_like
        Viewport rectangle [x, y, w, h].

    Examples
    --------

    Setting the viewports for both eyes on a single swap chain buffer::

        # Calculate the optimal eye buffer sizes for the FOVs, these will define
        # the dimensions of the render target.
        leftBufferSize, rightBufferSize = calcEyeBufferSizes()

        # Define the viewports, which specifies the region on the render target a
        # eye's image will be drawn to and accessed from. Viewports are rectangles
        # defined like [x, y, w, h]. The x-position of the rightViewport is offset
        # by the width of the left viewport.
        leftViewport = [0, 0, leftBufferSize[0], leftBufferSize[1]]
        rightViewport = [leftBufferSize[0], 0,
                         rightBufferSize[0], rightBufferSize[1]]

        # set both viewports
        setEyeRenderViewport(EYE_LEFT, leftViewport)
        setEyeRenderViewport(EYE_RIGHT, rightViewport)

    """
    global _eyeLayer
    _eyeLayer.Viewport[eye].Pos.x = <int>values[0]
    _eyeLayer.Viewport[eye].Pos.y = <int>values[1]
    _eyeLayer.Viewport[eye].Size.w = <int>values[2]
    _eyeLayer.Viewport[eye].Size.h = <int>values[3]


def getEyeViewMatrix(int eye, np.ndarray[np.float32_t, ndim=2] out=None):
    """Compute a view matrix for a specified eye.

    View matrices are derived from the eye render poses calculated by the
    last :func:`calcEyePoses` call or update by :func:`setEyeRenderPose`.

    Parameters
    ----------
    eye: int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    out : ndarray or None, optional
        Optional array to write to. Must have ndim=2, dtype=np.float32, and
        shape == (4,4).

    Returns
    -------
    ndarray
        4x4 view matrix. Object `out` will be returned if specified.

    """
    global _eyeViewMatrix
    cdef np.ndarray[np.float32_t, ndim=2] to_return

    if out is None:
        to_return = np.zeros((4, 4), dtype=np.float32)
    else:
        to_return = out

    cdef Py_ssize_t i, j, N
    i = j = 0
    N = 4
    for i in range(N):
        for j in range(N):
            to_return[i, j] = _eyeViewMatrix[eye].M[i][j]

    return to_return


def getPredictedDisplayTime(unsigned int frameIndex=0):
    """Get the predicted time a frame will be displayed.

    Parameters
    ----------
    frameIndex : int
        Frame index.

    Returns
    -------
    float
        Absolute frame mid-point time for the given frame index in seconds.

    """
    global _ptrSession
    cdef double t_sec = capi.ovr_GetPredictedDisplayTime(
        _ptrSession,
        frameIndex)

    return t_sec


def timeInSeconds():
    """Absolute time in seconds.

    Returns
    -------
    float
        Time in seconds.

    """
    cdef double t_sec = capi.ovr_GetTimeInSeconds()

    return t_sec


def waitToBeginFrame(unsigned int frameIndex=0):
    """Wait until a buffer is available so frame rendering can begin. Must be
    called before :func:`beginFrame`.

    Parameters
    ----------
    frameIndex : int
        The target frame index.

    Returns
    -------
    int
        Return code of the LibOVR API call ``OVR::ovr_WaitToBeginFrame``. 
        Returns ``SUCCESS`` if completed without errors. May return
        ``ERROR_DISPLAY_LOST`` if the device was removed, rendering the current 
        session invalid.

    """
    global _ptrSession
    cdef capi.ovrResult result = \
        capi.ovr_WaitToBeginFrame(_ptrSession, frameIndex)

    return <int>result


def beginFrame(unsigned int frameIndex=0):
    """Begin rendering the frame. Must be called prior to drawing and
    :func:`endFrame`.

    Parameters
    ----------
    frameIndex : int
        The target frame index.

    Returns
    -------
    int
        Error code returned by ``OVR::ovr_BeginFrame``.

    """
    global _ptrSession
    cdef capi.ovrResult result = \
        capi.ovr_BeginFrame(_ptrSession, frameIndex)

    return <int>result


def commitTextureSwapChain(int eye):
    """Commit changes to a given eye's texture swap chain. When called, the
    runtime is notified that the texture is ready for use, and the swap
    chain index is incremented.

    Parameters
    ----------
    eye : int
        Eye buffer index.

    Returns
    -------
    int
        Error code returned by API call ``OVR::ovr_CommitTextureSwapChain``. 
        Will return ``SUCCESS`` if successful. Returns error code
        ``ERROR_TEXTURE_SWAP_CHAIN_FULL`` if called too many times without 
        calling :func:`endFrame`.

    Warning
    -------
    No additional drawing operations are permitted once the texture is committed
    until the SDK dereferences it, making it available again.

    """
    global _swapChains
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_CommitTextureSwapChain(
        _ptrSession,
        _swapChains[eye])

    return <int>result


def endFrame(unsigned int frameIndex=0):
    """Call when rendering a frame has completed. Buffers which have been
    committed are passed to the compositor for distortion.

    Successful :func:`waitToBeginFrame` and :func:`beginFrame` call must precede
    calling :func:`endFrame`.

    Parameters
    ----------
    frameIndex : int
        The target frame index.

    Returns
    -------
    tuple (int, float)
        Error code returned by API call `OVR::ovr_EndFrame` and the absolute
        time in seconds `OVR::ovr_EndFrame` returned.

    """
    global _ptrSession
    global _eyeLayer
    global _eyeRenderPoses

    # if head locking is enabled, make sure the render poses are fixed to
    # HmdToEyePose
    if (_eyeLayer.Header.Flags & capi.ovrLayerFlag_HeadLocked) != \
            capi.ovrLayerFlag_HeadLocked:
        _eyeLayer.RenderPose = _eyeRenderPoses
    else:
        _eyeLayer.RenderPose[0] = _eyeRenderDesc[0].HmdToEyePose
        _eyeLayer.RenderPose[1] = _eyeRenderDesc[1].HmdToEyePose

    cdef capi.ovrLayerHeader* layers = &_eyeLayer.Header
    cdef capi.ovrResult result = capi.ovr_EndFrame(
        _ptrSession,
        frameIndex,
        NULL,
        &layers,
        <unsigned int>1)

    cdef double absTime = capi.ovr_GetTimeInSeconds()

    return result, absTime


def getTrackingOriginType():
    """Get the current tracking origin type.

    The tracking origin type specifies where the origin is placed when computing
    the pose of tracked objects (i.e. the head and touch controllers.) Valid
    values are ``TRACKING_ORIGIN_EYE_LEVEL`` and 
    ``TRACKING_ORIGIN_FLOOR_LEVEL``.

    See Also
    --------
    setTrackingOriginType : Set the tracking origin type.

    """
    global _ptrSession
    cdef capi.ovrTrackingOrigin originType = \
        capi.ovr_GetTrackingOriginType(_ptrSession)

    if originType == capi.ovrTrackingOrigin_FloorLevel:
        return TRACKING_ORIGIN_FLOOR_LEVEL
    elif originType == capi.ovrTrackingOrigin_EyeLevel:
        return TRACKING_ORIGIN_EYE_LEVEL


def setTrackingOriginType(int value):
    """Set the tracking origin type.

    Specify the tracking origin to use when computing eye poses. Subsequent
    calls of :func:`calcEyePoses` will use the set tracking origin.

    Parameters
    ----------
    value : int
        Tracking origin type, must be either ``TRACKING_ORIGIN_FLOOR_LEVEL`` or
        ``TRACKING_ORIGIN_EYE_LEVEL``.

    Returns
    -------
    int
        Result of the ``OVR::ovr_SetTrackingOriginType`` LibOVR API call.

    See Also
    --------
    getTrackingOriginType : Get the current tracking origin type.

    """
    cdef capi.ovrResult result
    global _ptrSession
    if value == TRACKING_ORIGIN_FLOOR_LEVEL:
        result = capi.ovr_SetTrackingOriginType(
            _ptrSession, capi.ovrTrackingOrigin_FloorLevel)
    elif value == TRACKING_ORIGIN_EYE_LEVEL:
        result = capi.ovr_SetTrackingOriginType(
            _ptrSession, capi.ovrTrackingOrigin_EyeLevel)
    else:
        raise ValueError("Invalid tracking origin type specified "
                         "must be 'TRACKING_ORIGIN_FLOOR_LEVEL' or "
                         "'TRACKING_ORIGIN_EYE_LEVEL'.")

    return result


def recenterTrackingOrigin():
    """Recenter the tracking origin.

    Returns
    -------
    int
        The result of the LibOVR API call ``OVR::ovr_RecenterTrackingOrigin``.

    Examples
    --------
    Recenter the tracking origin if requested by the session status::

        sessionStatus = getSessionStatus()
        if sessionStatus.shouldRecenter:
            recenterTrackingOrigin()

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_RecenterTrackingOrigin(
        _ptrSession)

    return result


def specifyTrackingOrigin(LibOVRPose newOrigin):
    """Specify a new tracking origin.

    Parameters
    ----------
    newOrigin : LibOVRPose
        New origin to use.

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_SpecifyTrackingOrigin(
        _ptrSession,
        newOrigin.c_data[0])

    return result


def clearShouldRecenterFlag():
    """Clear the :py:attr:`LibOVRSessionStatus.shouldRecenter` flag.

    """
    global _ptrSession
    capi.ovr_ClearShouldRecenterFlag(_ptrSession)


def getTrackerCount():
    """Get the number of attached trackers.

    Returns
    -------
    int
        Number of trackers reported by `LibOVR`.

    Notes
    -----
    * The Oculus Rift S uses inside-out tracking, therefore does not have
      external trackers. For compatibility, `LibOVR` will return a tracker count
      of 3.

    """
    global _ptrSession
    cdef unsigned int trackerCount = capi.ovr_GetTrackerCount(
        _ptrSession)

    return <int>trackerCount


def getTrackerInfo(int trackerIndex):
    """Get information about a given tracker.

    Parameters
    ----------
    trackerIndex : int
        The index of the sensor to query. Valid values are between 0 and
        :func:`getTrackerCount` - 1.

    Notes
    -----
    * The Oculus Rift S uses inside-out tracking, therefore does not have
      external trackers. For compatibility, `LibOVR` will dummy tracker objects.

    """
    cdef LibOVRTrackerInfo to_return = LibOVRTrackerInfo()
    global _ptrSession

    # set the tracker index
    to_return._trackerIndex = <unsigned int>trackerIndex

    # set the descriptor data
    to_return.c_ovrTrackerDesc = capi.ovr_GetTrackerDesc(
        _ptrSession, <unsigned int>trackerIndex)
    # get the tracker pose
    to_return.c_ovrTrackerPose = capi.ovr_GetTrackerPose(
        _ptrSession, <unsigned int>trackerIndex)

    return to_return


def getSessionStatus():
    """Get the current session status.

    Returns
    -------
    tuple (int, LibOVRSessionStatus)
        Result of LibOVR API call ``OVR::ovr_GetSessionStatus`` and a
        :py:class:`LibOVRSessionStatus`.

    Examples
    --------

    Check if the display is visible to the user::

        result, sessionStatus = getSessionStatus()
        if sessionStatus.isVisible:
            # begin frame rendering ...

    Quit if the user requests to through the Oculus overlay::

        result, sessionStatus = getSessionStatus()
        if sessionStatus.shouldQuit:
            # destroy any swap chains ...
            destroy()
            shutdown()

    """
    global _ptrSession
    global _sessionStatus

    cdef capi.ovrResult result = capi.ovr_GetSessionStatus(_ptrSession,
                                                           &_sessionStatus)

    cdef LibOVRSessionStatus to_return = LibOVRSessionStatus()
    to_return.c_data = _sessionStatus

    return result, to_return


def getPerfStats():
    """Get detailed compositor frame statistics.

    Returns
    -------
    LibOVRPerfStats
        Frame statistics.

    Examples
    --------
    Get the time spent by the application between :func:`endFrame` calls::

        result = updatePerfStats()

        if getFrameStatsCount() > 0:
            frameStats = getFrameStats(0)  # only the most recent
            appTime = frameStats.appCpuElapsedTime

    """
    global _ptrSession
    cdef LibOVRPerfStats to_return = LibOVRPerfStats()
    cdef capi.ovrResult result = capi.ovr_GetPerfStats(
        _ptrSession, to_return.c_data)

    return to_return


def resetPerfStats():
    """Reset frame performance statistics.

    Calling this will reset frame statistics, which may be needed if the
    application loses focus (eg. when the system UI is opened) and performance
    stats no longer apply to the application.

    Returns
    -------
    int
        Error code returned by ``OVR::ovr_ResetPerfStats``.

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_ResetPerfStats(_ptrSession)

    return result


def getLastErrorInfo():
    """Get the last error code and information string reported by the API.

    This function can be used when implementing custom error handlers for
    dealing with exceptions raised by LibOVR. You must call
    :func:`getLastErrorInfo` every time after any function which makes an LibOVR
    API call if you wish to catch all errors, since only the most recent is
    returned.

    Returns
    -------
    tuple (int, str)
        Tuple of the API call result and error string. If there was no API
        error, the function will return tuple (0, '<unknown>').

    Examples
    --------

    Raise a Python exception if LibOVR reports an error::

        result = create()
        if failure(result):
            errorVal, errorMsg = getLastErrorInfo()
            raise RuntimeError(errorMsg)  # Python generic runtime error!

    """
    cdef capi.ovrErrorInfo lastErrorInfo  # store our last error here
    capi.ovr_GetLastErrorInfo(&lastErrorInfo)

    cdef capi.ovrResult result = lastErrorInfo.Result
    cdef str errorString = lastErrorInfo.ErrorString.decode("utf-8")

    return <int>result, errorString


def setBoundaryColor(float red, float green, float blue):
    """Set the boundary color.

    The boundary is drawn by the compositor which overlays the extents of
    the physical space where the user can safely move.

    Parameters
    ----------
    red : float
        Red component of the color from 0.0 to 1.0.
    green : float
        Green component of the color from 0.0 to 1.0.
    blue : float
        Blue component of the color from 0.0 to 1.0.

    Returns
    -------
    int
        Result of the LibOVR API call ``OVR::ovr_SetBoundaryLookAndFeel``.

    """
    global _boundaryStyle
    global _ptrSession

    cdef capi.ovrColorf color
    color.r = <float>red
    color.g = <float>green
    color.b = <float>blue

    _boundaryStyle.Color = color

    cdef capi.ovrResult result = capi.ovr_SetBoundaryLookAndFeel(
        _ptrSession,
        &_boundaryStyle)

    return result


def resetBoundaryColor():
    """Reset the boundary color to system default.

    Returns
    -------
    int
        Result of the LibOVR API call ``OVR::ovr_ResetBoundaryLookAndFeel``.

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_ResetBoundaryLookAndFeel(
        _ptrSession)

    return result


def getBoundaryVisible():
    """Check if the Guardian boundary is visible.

    The boundary is drawn by the compositor which overlays the extents of
    the physical space where the user can safely move.

    Returns
    -------
    tuple (int, bool)
        Result of the LibOVR API call ``OVR::ovr_GetBoundaryVisible`` and the 
        boundary state.

    Notes
    -----
    * Since the boundary has a fade-in effect, the boundary might be reported as
      visible but difficult to actually see.

    """
    global _ptrSession
    cdef capi.ovrBool isVisible
    cdef capi.ovrResult result = capi.ovr_GetBoundaryVisible(
        _ptrSession, &isVisible)

    return result, isVisible


def showBoundary():
    """Show the boundary.

    The boundary is drawn by the compositor which overlays the extents of
    the physical space where the user can safely move.

    Returns
    -------
    int
        Result of LibOVR API call ``OVR::ovr_RequestBoundaryVisible``.

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_RequestBoundaryVisible(
        _ptrSession, capi.ovrTrue)

    return result


def hideBoundary():
    """Hide the boundry.

    Returns
    -------
    int
        Result of LibOVR API call ``OVR::ovr_RequestBoundaryVisible``.

    """
    global _ptrSession
    cdef capi.ovrResult result = capi.ovr_RequestBoundaryVisible(
        _ptrSession, capi.ovrFalse)

    return result


def getBoundaryDimensions(int boundaryType):
    """Get the dimensions of the boundary.

    Parameters
    ----------
    boundaryType : int
        Boundary type, can be ``BOUNDARY_OUTER`` or ``BOUNDARY_PLAY_AREA``.

    Returns
    -------
    tuple (int, ndarray)
        Result of the LibOVR APi call ``OVR::ovr_GetBoundaryDimensions`` and the
        dimensions of the boundary in meters [x, y, z].

    """
    global _ptrSession
    cdef capi.ovrBoundaryType btype = <capi.ovrBoundaryType>boundaryType
    if not (boundaryType == capi.ovrBoundary_PlayArea or
            boundaryType == capi.ovrBoundary_Outer):
        raise ValueError("Invalid boundary type specified.")

    cdef capi.ovrVector3f vec_out
    cdef capi.ovrResult result = capi.ovr_GetBoundaryDimensions(
            _ptrSession, btype, &vec_out)

    cdef np.ndarray[np.float32_t, ndim=1] to_return = np.asarray(
        (vec_out.x, vec_out.y, vec_out.z), dtype=np.float32)

    return result, to_return


def testBoundary(int deviceBitmask, int boundaryType):
    """Test collision of tracked devices on boundary.

    Parameters
    ----------
    deviceBitmask : int
        Devices to test. Multiple devices identifiers can be combined
        together. Valid device IDs are:

        * ``TRACKED_DEVICE_TYPE_HMD``: The head or HMD.
        * ``TRACKED_DEVICE_TYPE_LTOUCH``: Left touch controller or hand.
        * ``TRACKED_DEVICE_TYPE_RTOUCH``: Right touch controller or hand.
        * ``TRACKED_DEVICE_TYPE_TOUCH``: Both touch controllers.
        * ``TRACKED_DEVICE_TYPE_OBJECT0``
        * ``TRACKED_DEVICE_TYPE_OBJECT1``
        * ``TRACKED_DEVICE_TYPE_OBJECT2``
        * ``TRACKED_DEVICE_TYPE_OBJECT3``

    boundaryType : int
        Boundary type, can be ``BOUNDARY_OUTER`` or ``BOUNDARY_PLAY_AREA``.

    Returns
    -------
    tuple (int, LibOVRBoundaryTestResult)
        Result of the ``OVR::ovr_TestBoundary`` LibOVR API call and
        collision test results.

    """
    global _ptrSession

    cdef LibOVRBoundaryTestResult testResult = LibOVRBoundaryTestResult()
    cdef capi.ovrResult result = capi.ovr_TestBoundary(
        _ptrSession, <capi.ovrTrackedDeviceType>deviceBitmask,
        <capi.ovrBoundaryType>boundaryType,
        &testResult.c_data)

    return testResult


def getConnectedControllerTypes():
    """Get connected controller types.

    Returns
    -------
    list of int
        IDs of connected controller types. Possible values returned are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    See Also
    --------
    updateInputState : Poll a controller's current state.

    Examples
    --------

    Check if the left touch controller is paired::

        controllers = getConnectedControllerTypes()
        hasLeftTouch = CONTROLLER_TYPE_LTOUCH in controllers

    Update all connected controller states::

        for controller in getConnectedControllerTypes():
            result, time = updateInputState(controller)

    """
    global _ptrSession
    cdef unsigned int result = capi.ovr_GetConnectedControllerTypes(
        _ptrSession)

    cdef list toReturn = list()
    if (capi.ovrControllerType_XBox & result) == capi.ovrControllerType_XBox:
        toReturn.append(CONTROLLER_TYPE_XBOX)
    if (capi.ovrControllerType_Remote & result) == capi.ovrControllerType_Remote:
        toReturn.append(CONTROLLER_TYPE_REMOTE)
    if (capi.ovrControllerType_Touch & result) == capi.ovrControllerType_Touch:
        toReturn.append(CONTROLLER_TYPE_TOUCH)
    if (capi.ovrControllerType_LTouch & result) == capi.ovrControllerType_LTouch:
        toReturn.append(CONTROLLER_TYPE_LTOUCH)
    if (capi.ovrControllerType_RTouch & result) == capi.ovrControllerType_RTouch:
        toReturn.append(CONTROLLER_TYPE_RTOUCH)
    if (capi.ovrControllerType_Object0 & result) == capi.ovrControllerType_Object0:
        toReturn.append(CONTROLLER_TYPE_OBJECT0)
    if (capi.ovrControllerType_Object1 & result) == capi.ovrControllerType_Object1:
        toReturn.append(CONTROLLER_TYPE_OBJECT1)
    if (capi.ovrControllerType_Object2 & result) == capi.ovrControllerType_Object2:
        toReturn.append(CONTROLLER_TYPE_OBJECT2)
    if (capi.ovrControllerType_Object3 & result) == capi.ovrControllerType_Object3:
        toReturn.append(CONTROLLER_TYPE_OBJECT3)

    return toReturn


def updateInputState(int controller):
    """Refresh the input state of a controller.

    Subsequent :func:`getButton`, :func:`getTouch`, :func:`getThumbstickValues`,
    :func:`getIndexTriggerValues`, and :func:`getHandTriggerValues` calls using
    the same `controller` value will reflect the new state.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    Returns
    -------
    tuple (int, float)
        Result of the ``OVR::ovr_GetInputState`` LibOVR API call and polling 
        time in seconds.

    See Also
    --------
    getConnectedControllerTypes : Get a list of connected controllers.
    getButton: Get button states.
    getTouch: Get touches.

    """
    global _prevInputState
    global _inputStates
    global _ptrSession

    # get the controller index in the states array
    cdef int idx
    cdef capi.ovrInputState* previousInputState
    cdef capi.ovrInputState* currentInputState
    cdef capi.ovrResult result

    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # pointer to the current and previous input state
    previousInputState = &_prevInputState[idx]
    currentInputState = &_inputStates[idx]

    # copy the current input state into the previous before updating
    previousInputState[0] = currentInputState[0]

    # get the current input state
    result = capi.ovr_GetInputState(
        _ptrSession,
        <capi.ovrControllerType>controller,
        currentInputState)

    return result, currentInputState.TimeInSeconds


def getButton(int controller, int button, str testState='continuous'):
    """Get a button state.

    The `controller` to test is specified by its ID, defined as constants
    starting with :data:`CONTROLLER_TYPE_*`. Buttons to test are
    specified using their ID, defined as constants starting with
    :data:`BUTTON_*`. Button IDs can be ORed together for testing
    multiple button states. The returned value represents the button state
    during the last :func:`updateInputState` call for the specified
    `controller`.

    An optional trigger mode may be specified which defines the button's
    activation criteria. By default, `testState` is 'continuous' will return the
    immediate state of the button. Using 'rising' (or 'pressed') will
    return True once when the button transitions to being pressed between
    subsequent :func:`updateInputState` calls, whereas 'falling' (and
    'released') will return True once the button is released. If
    :func:`updateInputState` was called only once, 'rising' and 'falling' will
    return False.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    button : int
        Button to check. Values can be ORed together to test for multiple button
        presses. If a given controller does not have a particular button, False
        will always be returned. Valid button values are:

        * ``BUTTON_A``
        * ``BUTTON_B``
        * ``BUTTON_RTHUMB``
        * ``BUTTON_RSHOULDER``
        * ``BUTTON_X``
        * ``BUTTON_Y``
        * ``BUTTON_LTHUMB``
        * ``BUTTON_LSHOULDER``
        * ``BUTTON_UP``
        * ``BUTTON_DOWN``
        * ``BUTTON_LEFT``
        * ``BUTTON_RIGHT``
        * ``BUTTON_ENTER``
        * ``BUTTON_BACK``
        * ``BUTTON_VOLUP``
        * ``BUTTON_VOLDOWN``
        * ``BUTTON_HOME``
        * ``BUTTON_PRIVATE``
        * ``BUTTON_RMASK``
        * ``BUTTON_LMASK``

    testState : str
        State to test buttons for. Valid states are 'rising', 'falling',
        'continuous', 'pressed', and 'released'.

    Returns
    -------
    tuple (bool, float)
        Result of the button press and the time in seconds it was polled.

    See Also
    --------
    getTouch : Get touches.

    Examples
    --------
    Check if the 'X' button on the touch controllers was pressed::

        isPressed = getButtons(CONTROLLER_TYPE_TOUCH,
            BUTTON_X, 'pressed')

    Test for multiple buttons (e.g. 'X' and 'Y') being released::

        buttons = BUTTON_X | BUTTON_Y
        controller = CONTROLLER_TYPE_TOUCH
        isReleased = getButtons(controller, buttons, 'released')

    """
    global _prevInputState
    global _inputStates

    # get the controller index in the states array
    cdef int idx
    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # get the time the controller was polled
    cdef double t_sec = _inputStates[idx].TimeInSeconds

    # pointer to the current and previous input state
    cdef unsigned int curButtons = _inputStates[idx].Buttons
    cdef unsigned int prvButtons = _prevInputState[idx].Buttons

    # test if the button was pressed
    cdef bint stateResult = False
    if testState == 'continuous':
        stateResult = (curButtons & button) == button
    elif testState == 'rising' or testState == 'pressed':
        # rising edge, will trigger once when pressed
        stateResult = (curButtons & button) == button and \
                      (prvButtons & button) != button
    elif testState == 'falling' or testState == 'released':
        # falling edge, will trigger once when released
        stateResult = (curButtons & button) != button and \
                      (prvButtons & button) == button
    else:
        raise ValueError("Invalid trigger mode specified.")

    return stateResult, t_sec


def getTouch(int controller, int touch, str testState='continuous'):
    """Get a touch state.

    The `controller` to test is specified by its ID, defined as constants
    starting with :data:`CONTROLLER_TYPE_*`. Touches to test are
    specified using their ID, defined as constants starting with
    :data:`TOUCH_*`. Touch IDs can be ORed together for testing multiple
    touch states. The returned value represents the touch state during the last
    :func:`updateInputState` call for the specified `controller`.

    An optional trigger mode may be specified which defines a touch's
    activation criteria. By default, `testState` is 'continuous' will return the
    immediate state of the button. Using 'rising' (or 'pressed') will
    return ``True`` once when something is touched between subsequent
    :func:`updateInputState` calls, whereas 'falling' (and 'released') will
    return ``True`` once the touch is discontinued. If :func:`updateInputState`
    was called only once, 'rising' and 'falling' will return False.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

        However, touches are only applicable for devices which support that
        feature.

    touch : int
        Touch to check. Values can be ORed together to test for multiple
        touches. If a given controller does not have a particular touch,
        ``False`` will always be returned. Valid touch values are:

        * ``TOUCH_A``
        * ``TOUCH_B``
        * ``TOUCH_RTHUMB``
        * ``TOUCH_RSHOULDER``
        * ``TOUCH_X``
        * ``TOUCH_Y``
        * ``TOUCH_LTHUMB``
        * ``TOUCH_LSHOULDER``
        * ``TOUCH_LINDEXTRIGGER``
        * ``TOUCH_LINDEXTRIGGER``
        * ``TOUCH_LTHUMBREST``
        * ``TOUCH_RTHUMBREST``
        * ``TOUCH_RINDEXPOINTING``
        * ``TOUCH_RTHUMBUP``
        * ``TOUCH_LINDEXPOINTING``
        * ``TOUCH_LTHUMBUP``

    testState : str
        State to test touches for. Valid states are 'rising', 'falling',
        'continuous', 'pressed', and 'released'.

    Returns
    -------
    tuple (bool, float)
        Result of the touches and the time in seconds it was polled.

    See Also
    --------
    getButton : Get a button state.

    Notes
    -----
    * Special 'touches' ``TOUCH_RINDEXPOINTING``, ``TOUCH_RTHUMBUP``, 
      ``TOUCH_RTHUMBREST``, ``TOUCH_LINDEXPOINTING``, ``TOUCH_LINDEXPOINTING``,
      and ``TOUCH_LINDEXPOINTING``, can be used to recognise hand pose/gestures.

    Examples
    --------
    Check if the user is making a pointing gesture with their right index
    finger::

        isPointing = getTouch(
            controller=CONTROLLER_TYPE_LTOUCH,
            touch=TOUCH_LINDEXPOINTING)

    """
    global _prevInputState
    global _inputStates

    # get the controller index in the states array
    cdef int idx
    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # get the time the controller was polled
    cdef double t_sec = _inputStates[idx].TimeInSeconds

    # pointer to the current and previous input state
    cdef unsigned int curTouches = _inputStates[idx].Touches
    cdef unsigned int prvTouches = _prevInputState[idx].Touches

    # test if the button was pressed
    cdef bint stateResult = False
    if testState == 'continuous':
        stateResult = (curTouches & touch) == touch
    elif testState == 'rising' or testState == 'pressed':
        # rising edge, will trigger once when pressed
        stateResult = (curTouches & touch) == touch and \
                      (prvTouches & touch) != touch
    elif testState == 'falling' or testState == 'released':
        # falling edge, will trigger once when released
        stateResult = (curTouches & touch) != touch and \
                      (prvTouches & touch) == touch
    else:
        raise ValueError("Invalid trigger mode specified.")

    return stateResult, t_sec


def getThumbstickValues(int controller, bint deadzone=False):
    """Get analog thumbstick values.

    Get the values indicating the displacement of the controller's analog
    thumbsticks. Returns two tuples for the up-down and left-right of each
    stick. Values range from -1 to 1.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    deadzone : bool
        Apply a deadzone if True.

    Returns
    -------
    tuple (float, float)
        Thumbstick values.

    Examples
    --------

    Get the thumbstick values with deadzone for the touch controllers::

        ovr.updateInputState()  # get most recent input state
        leftThumbStick, rightThumbStick = ovr.getThumbstickValues(
            ovr.CONTROLLER_TYPE_TOUCH, deadzone=True)
        x, y = rightThumbStick  # left-right, up-down values for right stick

    """
    global _inputStates

    # get the controller index in the states array
    cdef int idx
    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # pointer to the current and previous input state
    cdef capi.ovrInputState* currentInputState = &_inputStates[idx]

    cdef float thumbstick_x0 = 0.0
    cdef float thumbstick_y0 = 0.0
    cdef float thumbstick_x1 = 0.0
    cdef float thumbstick_y1 = 0.0

    if deadzone:
        thumbstick_x0 = currentInputState[0].Thumbstick[0].x
        thumbstick_y0 = currentInputState[0].Thumbstick[0].y
        thumbstick_x1 = currentInputState[0].Thumbstick[1].x
        thumbstick_y1 = currentInputState[0].Thumbstick[1].y
    else:
        thumbstick_x0 = currentInputState[0].ThumbstickNoDeadzone[0].x
        thumbstick_y0 = currentInputState[0].ThumbstickNoDeadzone[0].y
        thumbstick_x1 = currentInputState[0].ThumbstickNoDeadzone[1].x
        thumbstick_y1 = currentInputState[0].ThumbstickNoDeadzone[1].y

    return np.array((thumbstick_x0, thumbstick_y0), dtype=np.float32), \
           np.array((thumbstick_x1, thumbstick_y1), dtype=np.float32)


def getIndexTriggerValues(int controller, bint deadzone=False):
    """Get analog index trigger values.

    Get the values indicating the displacement of the controller's analog
    index triggers. Returns values for the left an right sticks. Values range
    from -1 to 1.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    Returns
    -------
    tuple (float, float)
        Trigger values (left, right).

    See Also
    --------
    getThumbstickValues : Get thumbstick displacements.
    getHandTriggerValues : Get hand trigger values.

    Examples
    --------

    Get the index trigger values for touch controllers (with deadzone)::

        leftVal, rightVal = getIndexTriggerValues(CONTROLLER_TYPE_TOUCH,
            deadzone=True)

    Cast a ray from the controller when a trigger is pulled::

        _, rightVal = getIndexTriggerValues(CONTROLLER_TYPE_TOUCH,
            deadzone=True)

        # handPose of right hand from the last tracking state
        if rightVal > 0.75:  # 75% thresholds
            if handPose.raycastSphere(target):  # target is LibOVRPose
                print('Target hit!')
            else:
                print('Missed!')

    """
    # convert the string to an index
    global _inputStates

    # get the controller index in the states array
    cdef int idx
    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # pointer to the current and previous input state
    cdef capi.ovrInputState* currentInputState = &_inputStates[idx]

    cdef float triggerLeft = 0.0
    cdef float triggerRight = 0.0

    if deadzone:
        triggerLeft = currentInputState[0].IndexTrigger[0]
        triggerRight = currentInputState[0].IndexTrigger[1]
    else:
        triggerLeft = currentInputState[0].IndexTriggerNoDeadzone[0]
        triggerRight = currentInputState[0].IndexTriggerNoDeadzone[1]

    return np.array((triggerLeft, triggerRight), dtype=np.float32)


def getHandTriggerValues(int controller, bint deadzone=False):
    """Get analog hand trigger values.

    Get the values indicating the displacement of the controller's analog
    hand triggers. Returns two values for the left and right sticks. Values
    range from -1 to 1.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    Returns
    -------
    tuple (float, float)
        Trigger values (left, right).

    See Also
    --------
    getThumbstickValues : Get thumbstick displacements.
    getIndexTriggerValues : Get index trigger values.

    Examples
    --------

    Get the hand trigger values for touch controllers (with deadzone)::

        leftVal, rightVal = getHandTriggerValues(CONTROLLER_TYPE_TOUCH,
            deadzone=True)

    Grip an object if near a hand. Simply set the pose of the object to match
    that of the hand when gripping within some distance of the object's
    origin. When the grip is released, the object will assume the last pose
    before being released. Here is a very basic example of object gripping::

        _, rightVal = getHandTriggerValues(CONTROLLER_TYPE_TOUCH,
            deadzone=True)

        # thing and handPose are LibOVRPoses, handPose is from tracking state
        distanceToHand = abs(handPose.distanceTo(thing.pos))
        if rightVal > 0.75 and distanceToHand < 0.01:
            thing.posOri = handPose.posOri

    """
    global _inputStates

    # get the controller index in the states array
    cdef int idx
    if controller == CONTROLLER_TYPE_XBOX:
        idx = 0
    elif controller == CONTROLLER_TYPE_REMOTE:
        idx = 1
    elif controller == CONTROLLER_TYPE_TOUCH:
        idx = 2
    elif controller == CONTROLLER_TYPE_LTOUCH:
        idx = 3
    elif controller == CONTROLLER_TYPE_RTOUCH:
        idx = 4
    elif controller == CONTROLLER_TYPE_OBJECT0:
        idx = 5
    elif controller == CONTROLLER_TYPE_OBJECT1:
        idx = 6
    elif controller == CONTROLLER_TYPE_OBJECT2:
        idx = 7
    elif controller == CONTROLLER_TYPE_OBJECT3:
        idx = 8
    else:
        raise ValueError("Invalid controller type specified.")

    # pointer to the current and previous input state
    cdef capi.ovrInputState* currentInputState = &_inputStates[idx]

    cdef float triggerLeft = 0.0
    cdef float triggerRight = 0.0

    if deadzone:
        triggerLeft = currentInputState[0].HandTrigger[0]
        triggerRight = currentInputState[0].HandTrigger[1]
    else:
        triggerLeft = currentInputState[0].HandTriggerNoDeadzone[0]
        triggerRight = currentInputState[0].HandTriggerNoDeadzone[1]

    return np.array((triggerLeft, triggerRight), dtype=np.float32)


def setControllerVibration(int controller, str frequency, float amplitude):
    """Vibrate a controller.

    Vibration is constant at fixed frequency and amplitude. Vibration lasts
    2.5 seconds, so this function needs to be called more often than that
    for sustained vibration. Only controllers which support vibration can be
    used here.

    There are only two frequencies permitted 'high' and 'low', however,
    amplitude can vary from 0.0 to 1.0. Specifying frequency='off' stops
    vibration.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    frequency : str
        Vibration frequency. Valid values are: 'off', 'low', or 'high'.
    amplitude : float
        Vibration amplitude in the range of [0.0 and 1.0]. Values outside
        this range are clamped.

    Returns
    -------
    int
        Return value of API call ``OVR::ovr_SetControllerVibration``. Can return
        ``SUCCESS_DEVICE_UNAVAILABLE`` if no device is present.

    """
    global _ptrSession

    # get frequency associated with the string
    cdef float freq = 0.0
    if frequency == 'off':
        freq = amplitude = 0.0
    elif frequency == 'low':
        freq = 0.5
    elif frequency == 'high':
        freq = 1.0
    else:
        raise RuntimeError("Invalid frequency specified.")

    cdef capi.ovrResult result = capi.ovr_SetControllerVibration(
        _ptrSession,
        <capi.ovrControllerType>controller,
        freq,
        amplitude)

    return result


def getHapticsInfo(int controller):
    """Get information about the haptics engine for a particular controller.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_XBOX`` : XBox gamepad.
        * ``CONTROLLER_TYPE_REMOTE`` : Oculus Remote.
        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    Returns
    -------
    LibOVRHapticsInfo
        Haptics engine information. Values do not change over the course of a
        session.

    """
    global _ptrSession
    cdef LibOVRHapticsInfo to_return = LibOVRHapticsInfo()
    to_return.c_data = capi.ovr_GetTouchHapticsDesc(
        _ptrSession, <capi.ovrControllerType>controller,)

    return to_return


def submitControllerVibration(int controller, LibOVRHapticsBuffer buffer):
    """Submit a haptics buffer to Touch controllers.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    buffer : LibOVRHapticsBuffer
        Haptics buffer to submit.

    Returns
    -------
    int
        Return value of API call ``OVR::ovr_SubmitControllerVibration``. Can
        return ``SUCCESS_DEVICE_UNAVAILABLE`` if no device is present.

    """
    global _ptrSession

    cdef capi.ovrResult result = capi.ovr_SubmitControllerVibration(
        _ptrSession,
        <capi.ovrControllerType>controller,
        &buffer.c_data)

    return result


def getControllerPlaybackState(int controller):
    """Get the playback state of a touch controller.

    Parameters
    ----------
    controller : int
        Controller name. Valid values are:

        * ``CONTROLLER_TYPE_TOUCH`` : Combined Touch controllers.
        * ``CONTROLLER_TYPE_LTOUCH`` : Left Touch controller.
        * ``CONTROLLER_TYPE_RTOUCH`` : Right Touch controller.
        * ``CONTROLLER_TYPE_OBJECT0`` : Object 0 controller.
        * ``CONTROLLER_TYPE_OBJECT1`` : Object 1 controller.
        * ``CONTROLLER_TYPE_OBJECT2`` : Object 2 controller.
        * ``CONTROLLER_TYPE_OBJECT3`` : Object 3 controller.

    Returns
    -------
    tuple (int, int, int)
        Returns three values, the value of API call
        ``OVR::ovr_GetControllerVibrationState``, the remaining space in the
        haptics buffer available to queue more samples, and the number of
        samples currently queued.

    """
    global _ptrSession

    cdef capi.ovrHapticsPlaybackState playback_state
    cdef capi.ovrResult result = capi.ovr_GetControllerVibrationState(
        _ptrSession,
        <capi.ovrControllerType>controller,
        &playback_state)

    return result, playback_state.RemainingQueueSpace, playback_state.SamplesQueued


def cullPose(int eye, LibOVRPose pose):
    """Test if a pose's bounding box or position falls outside of an eye's view
    frustum.

    Poses can be assigned bounding boxes which enclose any 3D models associated
    with them. A model is not visible if all the corners of the bounding box
    fall outside the viewing frustum. Therefore any primitives (i.e. triangles)
    associated with the pose can be culled during rendering to reduce CPU/GPU
    workload.

    If `pose` does not have a valid bounding box (:py:class:`LibOVRBounds`)
    assigned to its :py:attr:`~LibOVRPose.bounds` attribute, this function will
    test is if the position of `pose` is outside the view frustum.

    Parameters
    ----------
    eye : int
        Eye index. Use either ``EYE_LEFT`` or ``EYE_RIGHT``.
    pose : LibOVRPose
        Pose to test.

    Returns
    -------
    bool
        ``True`` if the pose's bounding box is not visible to the given `eye`
        and should be culled during rendering.

    Examples
    --------
    Check if a pose should be culled (needs to be done for each eye)::

        cullModel = cullPose(eye, pose)
        if not cullModel:
            # ... OpenGL calls to draw the model here ...

    Notes
    -----
    * Frustums used for testing are defined by the current render FOV for the
      eye (see: :func:`getEyeRenderFov` and :func:`getEyeSetFov`).
    * This function does not test if an object is occluded by another within the
      frustum. If an object is completely occluded, it will still be fully
      rendered, and nearer object will be drawn on-top of it. A trick to
      improve performance in this case is to use ``glDepthFunc(GL_LEQUAL)`` with
      ``glEnable(GL_DEPTH_TEST)`` and render objects from nearest to farthest
      from the head pose. This will reject fragment color calculations for
      occluded locations.

    """
    # This is based on OpenXR's function `XrMatrix4x4f_CullBounds` found in
    # `xr_linear.h`
    global _eyeViewProjectionMatrix

    cdef libovr_math.Bounds3f* bbox
    cdef libovr_math.Vector4f test_point
    cdef libovr_math.Vector4f[8] corners
    cdef Py_ssize_t i

    # compute the MVP matrix to transform poses into HCS
    cdef libovr_math.Matrix4f mvp = \
        _eyeViewProjectionMatrix[eye] * \
        libovr_math.Matrix4f(<libovr_math.Posef>pose.c_data[0])

    if pose.bounds is not None:
        # has a bounding box
        bbox = pose._bbox.c_data

        # bounding box is cleared/not valid, don't cull
        if bbox.b[1].x <= bbox.b[0].x and \
                bbox.b[1].y <= bbox.b[0].y and \
                bbox.b[1].z <= bbox.b[0].z:
            return False

        # compute the corners of the bounding box
        for i in range(8):
            test_point = libovr_math.Vector4f(
                bbox.b[1].x if (i & 1) else bbox.b[0].x,
                bbox.b[1].y if (i & 2) else bbox.b[0].y,
                bbox.b[1].z if (i & 4) else bbox.b[0].z,
                1.0)
            corners[i] = mvp.Transform(test_point)

        # If any of these loops exit normally, the bounding box is completely
        # off to one side of the viewing frustum
        for i in range(8):
            if corners[i].x > -corners[i].w:
                break
        else:
            return True

        for i in range(8):
            if corners[i].x < corners[i].w:
                break
        else:
            return True

        for i in range(8):
            if corners[i].y > -corners[i].w:
                break
        else:
            return True

        for i in range(8):
            if corners[i].y < corners[i].w:
                break
        else:
            return True

        for i in range(8):
            if corners[i].z > -corners[i].w:
                break
        else:
            return True

        for i in range(8):
            if corners[i].z < corners[i].w:
                break
        else:
            return True
    else:
        # no bounding box, cull position of the pose
        test_point = mvp.Transform(
            libovr_math.Vector4f(
                pose.c_data.Position.x,
                pose.c_data.Position.y,
                pose.c_data.Position.z,
                1.0))

        if test_point.x <= -test_point.w:
            return True
        elif test_point.x >= test_point.w:
            return True
        elif test_point.y <= -test_point.w:
            return True
        elif test_point.y >= test_point.w:
            return True
        elif test_point.z <= -test_point.w:
            return True
        elif test_point.z >= test_point.w:
            return True

    return False