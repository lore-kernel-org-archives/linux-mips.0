From: "Roald Lygre" <roald@stavanger.sgi.com>
Message-ID: <9906301532.ZM1963@roald.stavanger.sgi.com>
Date: Wed, 30 Jun 1999 15:32:37 +0000
In-Reply-To: tor@spacetec.no (Tor Arntsen)
        "Re: IRIX Partations with HardHat Linux" (Jun 30,  3:24pm)
References: <199906301324.PAA14782@pallas.spacetec.no>
Subject: Re: IRIX Partations with HardHat Linux
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: Tor Arntsen <tor@spacetec.no>, swerner@fcc.net
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990630153237.sYxFWVl_kN_k4VMVrJtYkyDn8CekbJAKEJlJFQlOesc@z>

On Jun 30,  3:24pm, Tor Arntsen wrote:
> Subject: Re: IRIX Partations with HardHat Linux
> On Jun 30, 14:22, "Shane W." wrote:
> >I do have an IRIX CD-ROM, but I do not have a SCSI CD-ROM drive.  Am I out
of
> >luck as far as installing SGI Linux goes?
>
> The Indy can access a CD-ROM drive on another host (it's via tftp when
> from the PROM I believe).
>


But you still need to be able to read the IRIX OS CD (it is in efs format). So
you need the kernel that supports efs, as Dag pointed out.

-Roald



-- 
    
---------------------------------------------------------------
| Company: SGI Norge A/S                                      |
| Email:   roald@sgi.com          Tlf:          +47 5184 3633 |
| Addr:    St Olavsgt 9           Mobil:        +47 909 33 903|
|          N-4004 Stavanger       VMail (SGI):  870-4679      |
|          NORWAY                 VMail(ext):   67114679      |
|                                                             |
| SGI Norway's WWW Home Page: http://www.sgi.no               |
---------------------------------------------------------------
