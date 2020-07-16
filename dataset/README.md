## Dataset

**HTS_SN files (in [edf EEG data](https://github.com/Debu922/BCS_Mapping_of_Brain_Signals_2020/blob/master/dataset/edf%20EEG%20data.zip)):**  

- The HTS_SN33/SN34 files contain the actual EEG data in .edf file format (European Data Format).  
- This data is loaded onto the EEGLAB toolbox of MATLAB using the BioSig plugin available on the EEGLAB toolbox. The data corresponds to two different people undergoing the experiment twice (as 00 and 01 mentioned in the file) while having consumed Acetaminophen.
- The data was recorded using an EMOTIV Epoc Flex EEG recording device having 32 channels (while the EEG data when loaded onto EEGLAB has 76 channels, each channel giving a certain specific piece of information related to the data), a 128 Hz sampling rate, 14bits x 0.51uV EEG Resolution and a bandwidth of 0.2 to 45 Hz with heavy attenuation in 50-60 Hz range. 
- The EEG data is a continous time series of a little greater than 700 seconds for each dataset while each dataset has around 125 trials with slight variations in the number

**HTS_SN files (.zip files):**  

- These files contains .mat files, MATLAB data which contains all the behavioural data for that trial
- Each data file has numerous time-plotted data like M1_EyeX (x-coordinate of eye), M1_EyeY (y-coordinate of eye), M1_Pupil (Size of pupil), and many more including start and ending time of each trial, the coordinates of Joystick movement, time frames of cue presentation, Inter trial interval time data and reaction times. 
- These Behavioural files play a paramount role in artifact removal as they provide the necessary data to optimize the EEG data which is susceptible to noise and disturbance.
- The Eye Tracking data is the major aspect used to filter out and optimize the data.

**EEGmarkerlist (.docx file):**

This file gives the letter marker corresponding to every cue that is presented, the ASCII of which is encoded into the marker channel of edf data.

**json marker files:**

The json marker files give the numeric marker lists corresponding to eye data.
