# PPParticleButton
PPParticleButton is a UIButton subClass it has a cool tap animation, even though it can be used anywhere you can use a UIButton.
PPParticleButton uses SKEmitterNode of SpriteKit, to create the tap animation.
![alt animation image](https://github.com/HIkaruSato/PPParticleButton/blob/master/images/PPParticleButton.gif)

<br/>
## Requirements

 * iOS 8.0+
 * Xcode 7.2+

## Installation

### Create a Podfile.

```Podfile
platform :ios, '8.0'
use_frameworks!
pod 'PPParticleButton'
```

### Execute 'pod install'

```
$ pod install
```


## Usage

1. Select File->New->File...->Resource->SpriteKit Particle File, and create a sksFile.

2. Cutomize the SksFile on Xcode.
![Cutomize the SksFile](https://github.com/HIkaruSato/PPParticleButton/blob/master/images/PPPerticleButtonSKS_EditInXcode.gif)

3. Initialize a PPParticleButton class on code. or set to "PPParticleButton" of button's className on storyboard.
![Set to "PPParticleButton" of button's className](https://github.com/HIkaruSato/PPParticleButton/blob/master/images/set_classname_on_storyboard.png)

4. And only after you set the sksFile name (excluding the extension) to particleFileNameMap property of PPPerticleButton.

* When tapped, works animation always.

```
ppparticleButton.particleFileNameMap[PPParticleButtonEffectType.Normal] = "Particle File名"
```
<br/>

* When tapped, works animation during button unselected.

```
ppparticleButton.particleFileNameMap[PPParticleButtonEffectType.UnSelected] = "Particle File名"
```
<br/>
* When tapped, works animation during selected.

```
ppparticleButton.particleFileNameMap[PPParticleButtonEffectType.Selected] = "Particle File名"
```
<br/>

