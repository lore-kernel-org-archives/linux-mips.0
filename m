Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xvVCP-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: wd33c93 errors.
Date: Thu, 22 Jan 1998 22:34:13 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.980122162527.21753E-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jan 22, 98 04:50:16 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980122223413.ahwqEqllWrbM4chT9vQ0zrKilzU-moN9zbF-6mcf-e8@z>

> repartitioned it from Irix, and mounted it as an EFS partition under Irix
> just fine.  That would seem to indicate that everything is alright with

Including rewriting it ?

> SCSI disk error : host 0 channel 0 id 6 lun 0 return code 2800000
> Current error sd08:21: sense key Hardware Error
> Additional sense indicates Address mark not found for id field
> scsidisk I/O error: dev 08:21, sector 10
> scsi0: MEDIUM ERROR on channel 0, id 6, lun 0, CDB: Request Sense 00 00 00
> 10 00

Thats the SCSI verbage for bad block

> Current error sd08:21: sense key Medium Error
> Additional sense indicates Recorded entity not found

no address mark generally

> scsidisk I/O error: dev 08:21, sector 108
> scsi : aborting command due to timeout : pid 17577, scsi0, id 6, lun 0
> Write (6) 12 bb a2 f4 00
> scsi0: Aborting connected command 17577 - stopping DMA - sending wd33c93
> ABORT command - flushing fifo - asr = 25, sr=ff, 16777215 bytes
> un-transferred (timeout=-1) - sending wd33c93 DISCONNECT command = asr=00,
> sr=18.
> 
> And the whole thing is hung, hard.

Thats a bug. 

> surprised as it seems to work just fine under Irix.

See if you can rewrite every sector of it under Irix ..
