Message-ID: <006001c30004$5ef3c8d0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3E954651.C7AECB90@ekner.info> <20030410154050.GI5242@lug-owl.de> <3E95D16D.1671BA5A@ekner.info> <3E9673BF.2050808@murphy.dk>
Subject: Re: ext3 under MIPS?
Date: Fri, 11 Apr 2003 10:28:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Brian Murphy <brian@murphy.dk>, Hartvig Ekner <hartvig@ekner.info>
Cc: linux-mips@linux-mips.org
Message-ID: <20030411082831.R4a-59vcGQmucgXQmiMbBpLAliCuTTTF6yFu6egBvQE@z>

Could you guys please specify which endianness you're running?
This is just the sort of situation where that can end up being an issue.

----- Original Message ----- 
From: "Brian Murphy" <brian@murphy.dk>
To: "Hartvig Ekner" <hartvig@ekner.info>
Cc: <linux-mips@linux-mips.org>
Sent: Friday, April 11, 2003 9:50 AM
Subject: Re: ext3 under MIPS?


> Hartvig Ekner wrote:
> 
> >Is there anybody with ext3 up and running who would volunteer to do a couple of unclean
> >shutdowns and see if the recovery works without any fsck errors present afterwards?
> >
> >  
> >
> 
> Works every time here:
> 
> EXT3-fs: INFO: recovery required on readonly 
> filesystem.                       
> EXT3-fs: write access will be enabled during 
> recovery.                         
> kjournald starting.  Commit interval 5 
> seconds                                 
> EXT3-fs: recovery 
> complete.                                                    
> EXT3-fs: mounted filesystem with ordered data 
> mode.                            
> VFS: Mounted root (ext3 filesystem) 
> readonly.                                  
> Freeing unused kernel memory: 64k 
> freed                                        
> modprobe: modprobe: Can't open dependencies file 
> /lib/modules/2.4.21-pre4/modul)
> INIT: version 2.84 
> booting                                                     
> Activating 
> swap.                                                               
> Adding Swap: 131532k swap-space (priority 
> -1)                                  
> Checking root file 
> system...                                                   
> fsck 1.27 
> (8-Mar-2002)                                                         
> /dev/hda2: clean, 34571/1235456 files, 175807/2469096 
> blocks                   
> EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,2), internal 
> journal              
> System time was Fri Apr 11 07:45:01 UTC 
> 2003.                                  
> 
> mqpro:~# e2fsck 
> /dev/hda2                                                      
> e2fsck 1.27 
> (8-Mar-2002)                                                       
> /dev/hda2: clean, 34565/1235456 files, 175809/2469096 
> blocks                   
> mqpro:~# e2fsck -f 
> /dev/hda2                                                   
> e2fsck 1.27 
> (8-Mar-2002)                                                       
> Pass 1: Checking inodes, blocks, and 
> sizes                                     
> Pass 2: Checking directory 
> structure                                           
> Pass 3: Checking directory 
> connectivity                                        
> Pass 4: Checking reference 
> counts                                              
> Pass 5: Checking group summary 
> information                                     
> /dev/hda2: 34565/1235456 files (1.1% non-contiguous), 175809/2469096 
> blocks    
> mqpro:~#
> 
> 
> /Brian
> 
> 
> 
