Content-Type: text/plain;
  charset="iso-8859-1"
From: Shay Deloya <shay@jungo.com>
Reply-To: shay@jungo.com
Subject: Ioctl size mask
Date: Mon, 16 Apr 2001 13:44:42 +0300
MIME-Version: 1.0
Message-ID: <01041612582600.25043@athena.home.krftech.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010416104442.Mt4rxjmzj0W0lQ-vO51HxTbm5j3Jo_2axDSKpaHakgc@z>

Hi all,

On asm-mips/ioctl.h , there is a mask on the size transfered to the ioctl , 
e.g. : when implementing an ioctl that handles IO , the max size the 
supported in mips is 0xff  as defined in the code below: 


#define _IOWR(type,nr,size) 			
	_IOC(_IOC_READ|_IOC_WRITE,(type),(nr),sizeof(size))                          


and _IOC uses size in this way:

(((size) & _IOC_SLMASK) << _IOC_SIZESHIFT))           // (_IOC_SLMMASK = 0xff)


The limited size causes problems on drivers that use size mask to their 
needs, while officialy the allowed limit is 2^13 ( 8kB) by definition .

Does anyone know the reason for this masking and limit  ? 

Thanks,
Shay Deloya
______________________________________
Software Developer
Jungo - R&D
email: shayd@jungo.com
web: http://www.jungo.com
Phone: 1-877-514-0537(USA)  +972-9-8859365(Worldwide) ext. 221
Fax:   1-877-514-0538(USA)  +972-9-8859366(Worldwide)
