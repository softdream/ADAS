#include <ros/ros.h>
#include <j2_mono/Meta.h>
#include <iostream>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <sensor_msgs/Image.h>

using namespace message_filters;

int main( int argc, char **argv )
{
	ros::init( argc, argv, "image_render" );

	ros::NodeHandle n;
	
	message_filters::Subscriber<sensor_msgs::Image> imageSub( n, "/", 1 );
	message_filters::Subscriber<j2_mono::Meta> metaSub( n, "/Raw/metaData", 1 );

	//typedef sync_policies::ApproximateTime<sensor_msgs::Image, j2_mono::Meta> syncPolicy; //近似同步，非严格同步
	//Synchronizer<syncPolicy> sync(syncPolicy(10), imageSub, metaSub);  

	return 0;
}
