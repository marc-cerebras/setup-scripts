export CL_MACHINE=cramja@c220g2-011106.wisc.cloudlab.us


clsync() {
	rsync --exclude 'build*' --exclude '*.qs' -avzhe 'ssh' ~/workspace/incubator-quickstep/ $CL_MACHINE:/fastdisk/quickstep
}

clbuild() {
	ssh $CL_MACHINE "cd /fastdisk/quickstep/build && make -j16"
}

cl() {
	ssh $CL_MACHINE
}

clupdate() {
	clsync
	clbuild
}

clinit() {
	rsync -avzhe 'ssh' /home/marc/workspace/scripts/cloudlab-setup.sh $CL_MACHINE:~
	ssh $CL_MACHINE "chmod u+x ./cloudlab-setup.sh && ./cloudlab-setup.sh"
}
