Subject: Re: NFSROOT filesystem
Message-ID: <OF4628F9A8.67E419FF-ON88256A03.005A3DC5@taec.toshiba.com>
From: Lisa.Hsu@taec.toshiba.com
Date: Fri, 2 Mar 2001 08:31:41 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "H.Heinold" <heinold@physik.tu-cottbus.de>
Cc: linux-mips@oss.sgi.com, owner-linux-mips@oss.sgi.com
Message-ID: <20010302163141.2Ym0UHmz1VTsK5oD9GOk3JOC27-g6I8pQ6tEE5vSHEg@z>


As I understand, ash requires mush  less memory than other shells.  I am
working on an embedded system and memory is crucial to us.

Thanks,

Lisa



                                                                                                                       
                    heinold@physik.tu-                                                                                 
                    cottbus.de                To:     linux-mips@oss.sgi.com                                           
                    (H.Heinold)               cc:                                                                      
                    Sent by:                  Subject:     Re: NFSROOT filesystem                                      
                    owner-linux-mips@o                                                                                 
                    ss.sgi.com                                                                                         
                                                                                                                       
                                                                                                                       
                    03/02/01 12:17 AM                                                                                  
                                                                                                                       
                                                                                                                       




On Thu, Mar 01, 2001 at 01:30:57PM -0800, Lisa.Hsu@taec.toshiba.com wrote:
>
> Thanks to Henning for showing me where to get the big-endian compiled
> packages and it works.   Now, I need big-endian compiled "ash".
> Is anybody know where I can get it?
>
> Thanks,
>
> Lisa
>

Hm why you need the ash? You can give the kernel the follwing via the
commandoline init=/bin/bash.
--


Henning Heinold
