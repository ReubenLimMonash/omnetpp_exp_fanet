package fanet.simulations;

//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

import inet.node.inet.AdhocHost;
import inet.node.aodv.AodvRouter;
import inet.node.wireless.AccessPoint;
import inet.node.inet.WirelessHost;
import inet.node.inet.ManetRouter;
import inet.routing.aodv.Aodv;
import inet.routing.dsdv.Dsdv;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.physicallayer.wireless.apsk.packetlevel.ApskScalarRadioMedium;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;
import inet.node.inet.AdhocHost;
import inet.environment.common.PhysicalEnvironment;
import inet.visualizer.contract.IIntegratedVisualizer;
//import inet.visualizer.common.IntegratedMultiVisualizer;
//import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;
//import inet.visualizer.common.IntegratedVisualizer;

network fanet
{
    parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numHosts;
        int lastHostIndex;
        
    submodules:
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
		visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AodvRouter {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AodvRouter{
            @display("i=device/drone_s");
        }
        GCS: AodvRouter{
            @display("i=device/controller_s");
        }
//        baseStation: AccessPoint;
}

network fanet_adhoc_hosts
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPackets;
        int numHosts;
        // int numRepeats;
        int uavRadius = default(5);
        int packetSize = default(100);
        double sendingInterval = default(100.0);
        int packetSizeInterval = default(100);
        double sendingIntervalInterval = default(100.0);
        int uavPacketSizeStart; // Start of range for packet sizes from UAV
        int uavPacketSizeEnd; // End of range for packet sizes from UAV
        double uavSendingInterval; // Sending interval of UAV control data
        int gcsPacketSizeStart; // Start of range for packet sizes from UAV
        int gcsPacketSizeEnd; // End of range for packet sizes from UAV
        double gcsSendingIntervalStart; // Start of range for sending interval of GCS command packets
        double gcsSendingIntervalEnd; // End of range for sending interval of GCS command packets
        double videoBitRate; // UAV Video stream bit rate in Mbps
        int meanSI = default(100);
        double swarmDistance = default(100);
        int swarmHeight = default(100);
        // double uavSpeed;
        double simulationTime = default(100.0);
        int gcsY;
        int travelDistance;
//        string csvFileName = default("/home/reuben/Documents");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCS: AdhocHost{
            @display("i=device/controller_s");
        }
}

network fanet_adhoc_hosts_wt_interference
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPackets;
        int numHosts;
        int numUAVInterferers;
        int numGCSInterferers;
        // int numRepeats;
        int uavRadius = default(5);
        int packetSize = default(100);
        double sendingInterval = default(100.0);
        int packetSizeInterval = default(100);
        double sendingIntervalInterval = default(100.0);
        int uavPacketSizeStart; // Start of range for packet sizes from UAV
        int uavPacketSizeEnd; // End of range for packet sizes from UAV
        double uavSendingInterval; // Sending interval of UAV control data
        int gcsPacketSizeStart; // Start of range for packet sizes from UAV
        int gcsPacketSizeEnd; // End of range for packet sizes from UAV
        double gcsSendingIntervalStart; // Start of range for sending interval of GCS command packets
        double gcsSendingIntervalEnd; // End of range for sending interval of GCS command packets
        double videoBitRate; // UAV Video stream bit rate in Mbps
        int meanSI = default(100);
        double swarmDistance = default(100);
        int swarmHeight = default(100);
        // double uavSpeed;
        double simulationTime = default(100.0);
        int gcsY;
        int travelDistance;
//        string csvFileName = default("/home/reuben/Documents");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCS: AdhocHost{
            @display("i=device/controller_s");
        }
        uavInterferer[numUAVInterferers]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCSInterferer[numGCSInterferers]: AdhocHost{
            @display("i=device/controller_s");
        }
}

network fanet_adhoc_hosts_pcap
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPacketsRecord;
        int numHosts;
        // int numRepeats;
        int uavRadius = default(5);
        double simulationTime = default(130.0);
        int gcsY;
//        string csvFileName = default("/home/reuben/Documents");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCS: AdhocHost{
            @display("i=device/controller_s");
        }
}

network fanet_adhoc_hosts_pcap_wt_interference
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPacketsRecord;
        int numHosts;
        int numUAVInterferers;
        int numGCSInterferers;
        int uavRadius = default(5);
        double simulationTime = default(100.0);
        int gcsY;

    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCS: AdhocHost{
            @display("i=device/controller_s");
        }
        uavInterferer[numUAVInterferers]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCSInterferer[numGCSInterferers]: AdhocHost{
            @display("i=device/controller_s");
        }
}

network fanet_adhoc_hosts_pcap_wt_manet_interference
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPacketsRecord;
        int numHosts;
        int numManetHosts;
        int uavRadius = default(5);
        double simulationTime = default(100.0);

    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_s");
        }
        GCS: AdhocHost{
            @display("i=device/controller_s");
        }
        mGatewayNode: ManetRouter {
            @display("p=500,500;i=device/controller_s");
        }
        mAdhocNode[numManetHosts]: ManetRouter{
            @display("i=device/drone_s");
        }
}

network fanet_adhoc_hosts_test
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        int numPackets;
        int numPacketsRecord;
        int numHosts;
        // int numRepeats;
        int uavRadius = default(5);
        int packetSize = default(100);
        double sendingInterval = default(100.0);
        int packetSizeInterval = default(100);
        double sendingIntervalInterval;
        int uavPacketSizeStart; // Start of range for packet sizes from UAV
        int uavPacketSizeEnd; // End of range for packet sizes from UAV
        double uavSendingInterval; // Sending interval of UAV control data
        int gcsPacketSizeStart; // Start of range for packet sizes from UAV
        int gcsPacketSizeEnd; // End of range for packet sizes from UAV
        double gcsSendingInterval; // Sending interval of GCS command packets
        double videoBitRate; // UAV Video stream bit rate in Mbps
        int meanSI;
        double swarmDistance = default(100);
        int swarmHeight = default(100);
        // double uavSpeed;
        double simulationTime = default(100.0);
        int gcsY;
        int travelDistance;
//        string csvFileName = default("/home/reuben/Documents");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium{
            parameters:
                @display("p=-50,50");
        }
        
//        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
//            @display("p=100,50");
//        }
//        visualizer: IntegratedMultiVisualizer {
//            @display("p=100,50");
//        }
		visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
//		visualizer: IntegratedVisualizer {
//            parameters:
//                @display("p=-50,100");
//        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=-50,150");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_icon_transparent_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_icon_transparent_s");
        }
        GCS: AdhocHost{
            @display("i=device/drone_controller_icon_s");
        }
}

network manet_adhoc_hosts
{
    // Uses WirelessHost
 	parameters:
        @display("bgb=1000,1000;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
		int numHosts;
        int numManetHosts;
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium;
        
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=100,50");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=68,314");
        }
        gatewayNode: AdhocHost {
            @display("p=500,500;i=device/drone_icon_transparent_s");
        }
        adhocNode[numHosts]: AdhocHost{
            @display("i=device/drone_icon_transparent_s");
        }
        GCS: AdhocHost{
            @display("i=device/drone_controller_icon_s");
        }
        mGatewayNode: ManetRouter {
            @display("p=500,500;i=device/drone_s");
        }
        mAdhocNode[numManetHosts]: ManetRouter{
            @display("i=device/drone_s");
        }
}