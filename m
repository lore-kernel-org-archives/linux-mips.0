Content-Type: text/plain;
  charset="koi8-r"
From: Ilya Volynets <ilya@theIlya.com>
Reply-To: ilya@theIlya.com
Subject: Re: execve("sbin/init",argv_init,envp-init) in init() of main.c and sbin/init.
Date: Tue, 7 Aug 2001 20:59:31 -0700
References: <84CE342693F11946B9F54B18C1AB837B0A2294@ex2k.pcs.psdc.com>
In-Reply-To: <84CE342693F11946B9F54B18C1AB837B0A2294@ex2k.pcs.psdc.com>
MIME-Version: 1.0
Message-ID: <01080720593103.03147@gateway>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Steven Liu <stevenliu@psdc.com>, linux-mips@oss.sgi.com
Cc: dankamura@mvista.com
Message-ID: <20010808035931.EkG30QolAfEDVVoff3eEqMMQacaRxST6ZeYHSqyBmxc@z>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Look for SystemVinit at sunsite.unc.edu, or any other major free software archive.
Or just search alte vista...
On Tuesday 07 August 2001 17:36, Steven Liu wrote:
> Hi, ALL:
>
> I posted a message in this board regarding
> execve("sbin/init",argv_init,envp-init) in init() of main.c this
> morning. Pete gave some very good suggessions.Thank you very much, Pete.
> I tried them but the problem has not been solved yet. My CPU is not
> standard R3000 mips CPU with some registers added in and modified. For
> example, ASID field in EntryHi register is of 8 bits instead of 6 bits.
> This may creat some problems.
>
> I want to investigate the "sbin/init" program but I do not know where I
> can find the source code of this program. If you know any hint and let
> me know, I would be very pleased.
>
> Thank you for your help.
>
> Regards,
>
> Steven Liu
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjtwuSYACgkQtKh84cA8u2nn7gCeNd3zrFk3mPAzKubwGfW3EVEC
Cq4AoIyMVLJ0LSbc/1Iot28eCBSmaVaf
=UyqM
-----END PGP SIGNATURE-----
