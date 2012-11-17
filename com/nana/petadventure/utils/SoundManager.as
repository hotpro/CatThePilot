package com.nana.petadventure.utils
{
    import flash.media.*;

    public class SoundManager extends Object
    {
        private var sounds:Array;
        private var soundTrackChannel:SoundChannel;
        private var soundChannels:Array;
        private var soundMute:Boolean = false;
        private var tempSoundTransform:SoundTransform;
        private var muteSoundTransform:SoundTransform;
        private var tempSound:Sound;

        public function SoundManager()
        {
            this.soundTrackChannel = new SoundChannel();
            this.soundChannels = [];
            this.tempSoundTransform = new SoundTransform();
            this.muteSoundTransform = new SoundTransform();
            this.sounds = new Array();
            return;
        }

        public function playSound(name:String, param2:Boolean = false, param3:Number = 1, param4:Number = 0, param5:Number = 1) : void
        {
            this.tempSoundTransform.volume = param5;
            this.tempSound = this.sounds[name];
            if (param2)
            {
                if (this.soundTrackChannel != null)
                {
                    this.soundTrackChannel.stop();
                }
                this.soundTrackChannel = this.tempSound.play(param4, param3);
                this.soundTrackChannel.soundTransform = this.tempSoundTransform;
            }
            else
            {
                this.soundChannels[name] = this.tempSound.play(param4, param3);
                this.soundChannels[name].soundTransform = this.tempSoundTransform;
            }
            return;
        }

        public function addSound(name:String, sd:Sound) : void
        {
            this.sounds[name] = sd;
            return;
        }

        public function stopSound(param1:String, param2:Boolean = false) : void
        {
            if (param2)
            {
                this.soundTrackChannel.stop();
            }
            else
            {
                this.soundChannels[param1].stop();
            }
            return;
        }

        public function muteSound() : void
        {
            if (this.soundMute)
            {
                this.soundMute = false;
                this.muteSoundTransform.volume = 1;
                SoundMixer.soundTransform = this.muteSoundTransform;
            }
            else
            {
                this.muteSoundTransform.volume = 0;
                SoundMixer.soundTransform = this.muteSoundTransform;
                this.soundMute = true;
            }
            return;
        }

    }
}
