From: "Soeren Laursen" <soeren.laursen@scrooge.dk>
Date: Mon, 17 Sep 2001 18:16:34 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: openssh probs
Reply-to: soeren.laursen@scrooge.dk
Message-ID: <3BA63E02.20088.2100546@localhost>
In-reply-to: <Pine.SOL.4.31.0109171207130.15518-100000@fury.csh.rit.edu>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, George Gensure <werkt@csh.rit.edu>
Message-ID: <20010917161634.6mEMPBgk_F_wUVLZ4KkAAPdXlbgxBobprQX6NcTEltQ@z>

> Has anyone had any success running openssh on an Indy r5000? Currently
> running 2.4.8 #4, and the error I get when running ssh is "Disconnecting:
> Corrupted MAC on input."
Yep, upgraded to openssh 2.x and the vanished.

I guess it was an implementation error because I got it as well on 
i386 running openssh 1.x.

It depended on the client software as well. Other systems running 
openssh could connect. Client from www.ssh.com could not 
connect.

Best regards,

Soeren,
