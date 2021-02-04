#include <ros/ros.h>
#include "visualization_msgs/Marker.h"
#include <visualization_msgs/MarkerArray.h>

#include <sstream>

#include <j2_mono/Meta.h>

#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <vector>
#include <string.h>
#include "tf/transform_datatypes.h"//转换函数头文件

ros::Publisher marker_pub ;
ros::Publisher marker_pub2;
ros::Publisher marker_pub3;

visualization_msgs::MarkerArray cube_marker;
visualization_msgs::MarkerArray line_marker;
visualization_msgs::MarkerArray text_marker;
visualization_msgs::MarkerArray traffic_marker;

template<typename T>
std::string num2String( const T num )
{
	std::stringstream ss;
	ss << num;
	return ss.str();
}

float travelThePointsOnTheLine( float x, std::vector<float> &coeffs )
{
	float y;
	if( !coeffs.empty() ){
		y = coeffs[0];
		float xd = x;
		for( int d  = 1; d < coeffs.size(); ++ d ){
			y += coeffs[d] * xd;
			xd *= x;
		}
	}
	return y;
}

void publishObstaclesMarker( std::vector<j2_mono::Obstacle> &obstacle_array, visualization_msgs::MarkerArray& marker_array )
{
	if (obstacle_array.empty()){
    		std::cerr << "Obstacle_Array: input vector is empty!" << std::endl;
  	  	return;
  	}
  	marker_array.markers.clear();
  	visualization_msgs::Marker box_marker;
  	box_marker.header.frame_id = "car_frame"; // change by the users
  	box_marker.header.stamp = ros::Time::now();
  	box_marker.ns = "";
  	box_marker.color.r = 0.0f;
  	box_marker.color.g = 1.0f;
  	box_marker.color.b = 0.0f;
  	box_marker.color.a = 0.2;
  	//box_marker.lifetime = ros::Duration();
  	box_marker.frame_locked = true;
  	box_marker.type = visualization_msgs::Marker::CUBE;
  	box_marker.action = visualization_msgs::Marker::ADD;	

	for( auto it = obstacle_array.begin(); it != obstacle_array.end(); it ++ ){
		if( it->type == 0 || it->type == 1 || it->type == 2 || it->type == 18 ){
			box_marker.id = it->id;
		//	box_marker.lifetime = ros::Duration( it->life_time / 1000 );
			box_marker.lifetime = ros::Duration( 0.3 );
			box_marker.pose.position.x = it->world_info.position.x;
			box_marker.pose.position.y = it->world_info.position.y;
			box_marker.pose.position.z = it->world_info.position.z;
	
			geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw( it->world_info.yaw );//只通过y即绕z的旋转角度计算四元数
			box_marker.pose.orientation.x = q.x;
			box_marker.pose.orientation.y = q.y;
			box_marker.pose.orientation.z = q.z;		
			box_marker.pose.orientation.w = q.w;
	
			if( it->type == 2 ){// pedestrian
				box_marker.scale.x = 0.6f;
				box_marker.scale.y = 0.6f;
				box_marker.scale.z = 1.5f;
			}
			else{
				box_marker.scale.x = it->world_info.length;
				box_marker.scale.y = it->world_info.width;
				box_marker.scale.z = it->world_info.height;
			}
		
			marker_array.markers.push_back( box_marker );
		}
	}
	if( marker_array.markers.size() > 0 ){
		marker_pub.publish( marker_array );
	}
}

void publishTextMarker( std::vector<j2_mono::Obstacle> &obstacle_array, visualization_msgs::MarkerArray& marker_array )
{
	if (obstacle_array.empty()){
                std::cerr << "Obstacle_Array: input vector is empty!" << std::endl;
                return;
        }
	
	marker_array.markers.clear();
        visualization_msgs::Marker text_marker;
	
	text_marker.header.frame_id = "car_frame";
	text_marker.header.stamp = ros::Time::now();
	text_marker.ns = "";
	text_marker.color.r = 1.0f;
	text_marker.color.g = 0.0f;
	text_marker.color.b = 0.0f;
	text_marker.color.a = 1.0f;
	text_marker.scale.z = 0.3f;
	text_marker.type = visualization_msgs::Marker::TEXT_VIEW_FACING; 
	text_marker.action = visualization_msgs::Marker::ADD;

	 for( auto it = obstacle_array.begin(); it != obstacle_array.end(); it ++ ){
		text_marker.id = it->id;
		//text_marker.lifetime = ros::Duration( it->life_time / 1000 );
		text_marker.lifetime = ros::Duration( 0.1 );

		if( it->type == 3 || it->type == 4 || it->type == 5 || it->type == 6 ){
			text_marker.pose.position.x = it->world_info.position.x + it->world_info.length * 0.5 ;
                        text_marker.pose.position.y = it->world_info.position.y + it->world_info.width * 0.5;
                        text_marker.pose.position.z = it->world_info.position.z + it->world_info.height + 1.0 ;
		}
		else {
			text_marker.pose.position.x = it->world_info.position.x + it->world_info.length * 0.5 ;
			text_marker.pose.position.y = it->world_info.position.y + it->world_info.width * 0.5;
			text_marker.pose.position.z = it->world_info.position.z + it->world_info.height;
		}
		//text_marker.pose.orientation.w = 1.0f;
		geometry_msgs::Quaternion q = tf::createQuaternionMsgFromYaw( it->world_info.yaw );//只通过y即绕z的旋转角度计算四元数
                text_marker.pose.orientation.x = q.x;
                text_marker.pose.orientation.y = q.y;
                text_marker.pose.orientation.z = q.z;
                text_marker.pose.orientation.w = q.w;		

		//---------------- For testing ---------------//
		/*std::cout<<"pose.x = "<<text_marker.pose.position.x<<std::endl;
		std::cout<<"pose.y = "<<text_marker.pose.position.y<<std::endl;
		std::cout<<"pose.z = "<<text_marker.pose.position.z<<std::endl;
		std::cout<<"------------------------"<<std::endl;
	
		std::cout<<"Obstacle Type = "<<it->type<<std::endl;*/
		//--------------------------------------------//

		switch( it->type ){
			case 0: {
				std::string s = "VehicleRear\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s;
				break;
			}
			case 1: {
				std::string s = "VehicleFull\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			case 2:	{
				std::string s = "Pedestrian\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s;
				break;
			}
			case 3: {
				std::string s = "TrafficSign\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			case 4:	{
				std::string s = "TrafficLight\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			case 5: {
				std::string s = "ParkingSlot\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			case 6: {
				std::string s = "RoadSign\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			case 7: {
				std::string s = "Cyclist\r\nPosition:(" + num2String<double>(it->world_info.position.x) + ", " + num2String<double>(it->world_info.position.y) + ", " + num2String<double>(it->world_info.position.z) + ")";
				text_marker.text = s; 
				break;
			}
			default:break;
		}
		marker_array.markers.push_back( text_marker );
	}
	
	if( marker_array.markers.size() > 0 ){
		marker_pub3.publish( marker_array );
	}
}

void publishLinesMarker( std::vector<j2_mono::Line> &line_array, visualization_msgs::MarkerArray& marker_array )
{
	if( line_array.empty() ){
		std::cerr<<"The lines Array is empty ..."<<std::endl;
		return ;
	}
	marker_array.markers.clear();
        visualization_msgs::Marker line_list;
	line_list.header.frame_id = "car_frame";
	line_list.header.stamp = ros::Time::now();
	line_list.ns = "";
	line_list.color.r = 1.0f;
	line_list.color.g = 0.0f;
	line_list.color.b = 0.0f;
	line_list.color.a = 1.0f;
	line_list.scale.x = 0.1f; // width of the lines
	line_list.frame_locked = true;
	line_list.type = visualization_msgs::Marker::LINE_LIST;
	line_list.action = visualization_msgs::Marker::ADD;
	
	//std::cout<<"line array.size = "<<line_array.size()<<std::endl;
	for( auto it = line_array.begin(); it != line_array.end(); it ++ ){
		for( int x = it->end_points[1].x; x <= it->end_points[0].x; x += 1 ){
			std::vector<float> coeffs = it->coeffs;
			float y = travelThePointsOnTheLine( x, coeffs );
			line_list.id = it->id;
			//line_list.lifetime = ros::Duration( it->life_time / 1000);
			line_list.lifetime = ros::Duration( 0.1 );

			line_list.pose.orientation.w = 1.0f;
			
			geometry_msgs::Point p;
			p.x = x;
			p.y = y; 
			p.z = 0.0f;
			//---------- Test ------------//
		//	std::cout<<"Point.x = "<<p.x<<std::endl;
		//	std::cout<<"Point.y = "<<p.y<<std::endl;
		//	std::cout<<"----------"<<std::endl;	
		
			line_list.points.push_back( p );
		}
		marker_array.markers.push_back( line_list );
		
		if( marker_array.markers.size() > 0 ){
			marker_pub.publish( marker_array );
		}
		line_list.points.clear();
	}
	if( marker_array.markers.size() > 0 ){
		marker_pub.publish( marker_array );
	}
	line_array.clear();
}

void publishTrafficSign( std::vector<j2_mono::Obstacle> &obstacle_array, visualization_msgs::MarkerArray& marker_array )
{
	if (obstacle_array.empty()){
                std::cerr << "Obstacle_Array: input vector is empty!" << std::endl;
                return;
        }

        marker_array.markers.clear();
        visualization_msgs::Marker cylinder_marker;	

	cylinder_marker.header.frame_id = "car_frame";
        cylinder_marker.header.stamp = ros::Time::now();
        cylinder_marker.ns = "";
        //cylinder_marker.color.r = 1.0f;
        //cylinder_marker.color.g = 0.0f;
        //cylinder_marker.color.b = 0.0f;
        //cylinder_marker.color.a = 1.0f;
        cylinder_marker.scale.z = 0.3f;
        cylinder_marker.type = visualization_msgs::Marker::CYLINDER;
        cylinder_marker.action = visualization_msgs::Marker::ADD;
	
	
        for( auto it = obstacle_array.begin(); it != obstacle_array.end(); it ++ ){
		if( it->type == 3 || it->type == 4 || it->type == 5 || it->type == 6 ){
			cylinder_marker.id = it->id;
        	        //text_marker.lifetime = ros::Duration( it->life_time / 1000 );
                	cylinder_marker.lifetime = ros::Duration( 0.1 );
		
        	        cylinder_marker.pose.position.x = it->world_info.position.x + it->world_info.length * 0.5 ;
                	cylinder_marker.pose.position.y = it->world_info.position.y + it->world_info.width * 0.5;
                	cylinder_marker.pose.position.z = it->world_info.position.z + it->world_info.height;
			
			geometry_msgs::Quaternion q = tf::createQuaternionMsgFromRollPitchYaw( 0, 80, 0 );
			cylinder_marker.pose.orientation.x = q.x;
			cylinder_marker.pose.orientation.y = q.y;
			cylinder_marker.pose.orientation.z = q.z;
			cylinder_marker.pose.orientation.w = q.w;
			
			if( it->type == 4 ){
				if( !it->property_name[1].compare( "green" ) ){//green
					cylinder_marker.color.r = 0.0f;
		        		cylinder_marker.color.g = 1.0f;
				        cylinder_marker.color.b = 0.0f;
        				cylinder_marker.color.a = 1.0f;
				}
				else if( !it->property_name[1].compare( "yellow" ) ){//yellow
					cylinder_marker.color.r = 1.0f;
                                        cylinder_marker.color.g = 1.0f;
                                        cylinder_marker.color.b = 0.0f;
                                        cylinder_marker.color.a = 1.0f;
				}
				else if( !it->property_name[1].compare( "red" ) ){//red
					cylinder_marker.color.r = 1.0f;
                                        cylinder_marker.color.g = 0.0f;
                                        cylinder_marker.color.b = 0.0f;
                                        cylinder_marker.color.a = 1.0f;
				}
				else {}
			}
			else{
				cylinder_marker.color.r = 1.0f;
                                cylinder_marker.color.g = 0.0f;
                                cylinder_marker.color.b = 0.0f;
                                cylinder_marker.color.a = 1.0f;

			}
	
			cylinder_marker.scale.x = 1.0f;
			cylinder_marker.scale.y = 1.0f;
			cylinder_marker.scale.z = 0.2f;
			
			marker_array.markers.push_back( cylinder_marker );
		}
		
	}

	if( marker_array.markers.size() > 0 ){
                marker_pub2.publish( marker_array );
        }

}


void MetaCallback( const j2_mono::Meta::ConstPtr &metaPtr )
{
	std::cout<<"meta data callback ..."<<std::endl;\
	//-------------------- Parsing the Meta ------------------------//
	j2_mono::StructurePerception structurePerception = metaPtr->data.structure_perception;
	
	//-------------------- Parsing the Obstacles ------------------//
	std::vector<j2_mono::Obstacles> obstacles = structurePerception.obstacles;
	for( auto it = obstacles.begin(); it != obstacles.end(); it ++ ){
		std::vector<j2_mono::Obstacle> obstacle = it->obstacle;
		publishObstaclesMarker( obstacle, cube_marker );

		publishTextMarker( obstacle, text_marker );

		publishTrafficSign( obstacle, traffic_marker );
	}

	
	//------------------- Parsing the Lines -----------------------//
	std::vector<j2_mono::Lines> lines = structurePerception.lines;
	for( auto it = lines.begin(); it != lines.end(); it ++ ){
		std::vector<j2_mono::Line> line = it->lines;
		publishLinesMarker( line, line_marker );	
	}
}

int main(int argc,char** argv)
{
	ROS_INFO( "Program Begins ..." );
	ros::init(argc,argv,"mono_visualization");	
	ros::NodeHandle n;

	ros::Subscriber sub = n.subscribe<j2_mono::Meta>( "/Meta/SourceData", 1, MetaCallback );	

	marker_pub = n.advertise<visualization_msgs::MarkerArray>("/visualization_marker", 1);
	marker_pub2 = n.advertise<visualization_msgs::MarkerArray>( "/marker2", 1 );
	marker_pub3 = n.advertise<visualization_msgs::MarkerArray>("/visualization_text", 1);

	ros::spin();

	return 0;
}
