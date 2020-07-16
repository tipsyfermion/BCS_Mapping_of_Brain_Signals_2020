## Artifact Removal

**Why do we have to look at the eye data?**

[Eye movements on EEG (youtube video)](https://www.youtube.com/watch?v=-71ppPF02qw)  
The Eye being polar intereferes with the recording of the EEG data which is suscpetible to noise and disturbance. The Eye tracking data is most prominently removed and optimzied due to the eye being polar and the recording channels being close to the Eye. There are other modes of noise too but these can be generally neglected.

**Blinks and Saccades:**

- Blink: Going by the definition blink is the process of shutting and opening the eyes quickly. Blinks have has a big influence on the EEG data. This is because of a reflect known as [Bell's Phenomenon](https://en.wikipedia.org/wiki/Bell%27s_phenomenon) which causes the eyeball to drift upwards when the eyes close. The eye being polar causes a shockwave of electrical activity to propogate along the skull which may contaminate the EEG data. Apart from this blinks also contribute to contamination because of the muscle movements inlovled. This is why blink data must be screened.

- Saccade: A saccade is a quick, simultaneous movement of both eyes between two or more phases of fixation in the same direction. These can be categorised by their high velocities and rapid acceleration, using which saccades can be detected and EEG data optimized. Due to the polar nature of the eye and the data muscular movemnents in saccades, they contaminate the EEG data and hence must be screened.

**Methodology:**

- Blinks: The eyetracking data reports blinks by reporting values as outliers in the visual space (beyond the [-20,20] deg screen). It is because of this property that the blinks can be detected with ease with the help of a simple threshold. After the threshold some padding is applied to take care of errors that arise in the pre and post blink data.

- Saccades: Saccades because of their quick and projectile nature, are outliers in the velocity space. Hence to detect the saccades, the position data had to be filtered properly to account for the noise, and then differentiated to get the velocities. A threshold on this velocity was then calculated by considering the mean and twice the standard deviation to accurately detect the saccades. An example of identified saccades are given in the diagram below.

![Visualized saccade](/artifact_removal/blink_and_saccade_removal/visualize_saccade.jpg "Visualized saccade")

- Alternative: This is another method which was explored by the team was with the use of the **EYE-EEG toolbox** of EEGLAB, which establishes a connection between eye tracking (ET) and EEG data by synchronizing them and gives an option of optimized ICA decomposition on the basis of detected time stamps for saccades as well as blanks which guarantees improved filters. The [tutorial](http://www2.hu-berlin.de/eyetracking-eeg/tutorial.html) for the toolbox can be seen in the link.
The toolbox presents 3 ways to do so, out of which, the method with Messages + Triggers seems suitable for our study. The format of the recorded data does not suit the toolbox as it is. So, the team was working on reformatting the data, manually by finding out messages and triggers.

#### References:

- [An improved algorithm for automatic detection of saccades in eye movement data and for calculating saccade parameters](https://link.springer.com/article/10.3758%2FBRM.42.3.701)
- [Optimizing the ICA-based removal of ocular EEG artifacts from free viewing experiments](https://reader.elsevier.com/reader/sd/pii/S1053811919307086?token=AD12D8C5F5118E4808397933D94A17C2D52070BD4C7FF16DFB37694C354736F3876A62D65CDA5131DD0578879B06C857)
- [Detecting saccades with jerk](https://www.sciencedirect.com/science/article/pii/S0042698997004100#:~:text=In%20studies%20of%20smooth%20eye,position%20with%20respect%20to%20time)
- [Microsaccades uncover the orientation of covert attention](https://www.sciencedirect.com/science/article/pii/S0042698903000841)
- [A new and general approach to signal denoising and eye movement classification based on segmented linear regression](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5735175/)
- [Advances in Eye Tracking Technology: Theory, Algorithms, and Applications](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5059517/)
