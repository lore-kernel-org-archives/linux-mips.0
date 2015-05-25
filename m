Received: from mailapp01.imgtec.com ([195.59.15.196]:42119 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012589AbbEYN3fALyPU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 25 May 2015 15:29:35 +0200
Date: Mon, 25 May 2015 14:29:30 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 00/15] MIPS Malta DT Conversion
Message-ID: <20150525132930.GR13811@NP-P-BURTON>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
 <CAOS_Y6TRN2b5PGxWdO6SD5W2Wmo33Z88DeHw7Jrxw4TzzVYLcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
In-Reply-To: <CAOS_Y6TRN2b5PGxWdO6SD5W2Wmo33Z88DeHw7Jrxw4TzzVYLcA@mail.gmail.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Landley <rob@landley.net>
Cc: linux-mips@linux-mips.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jiri Slaby <jslaby@suse.cz>, Paolo Bonzini <pbonzini@redhat.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Hannes Reinecke <hare@suse.de>, Andrew Bresticker <abrestic@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ralf Baechle <ralf@linux-mips.org>, Qais Yousef <qais.yousef@imgtec.com>, linux-serial@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Christoph Hellwig <hch@lst.de>, Michal Marek <mmarek@suse.cz>, Jason Cooper <jason@lakedaemon.net>, "David S. Miller" <davem@davemloft.net>, Bart Van Assche <bvanassche@acm.org>, Jeffrey Deans <jeffrey.deans@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20150525132930.HBHlwWFDwQzG6vYtheHE1rM1m81GazSXpNBDZZ9IYvU@z>

--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 02:59:31AM -0500, Rob Landley wrote:
> On Fri, May 22, 2015 at 10:50 AM, Paul Burton <paul.burton@imgtec.com> wr=
ote:
> > This series begins converting the MIPS Malta board to use device tree,
> > which is done with a few goals in mind:
> >
> >   - To modernise the Malta board support, providing a cleaner example to
> >     people referencing it when bringing up new boards and reducing the
> >     amount of code they need to write.
> >
> >   - To make the code at the board level more generic with the eventual
> >     aim of sharing it between multiple boards & allowing for
> >     multi-platform kernel binaries. Although this series doesn't result
> >     in the kernel reaching those goals, it is a step in that direction.
> >
> >   - To result in a more maintainable kernel through a combination of the
> >     above.
>=20
> How would I go about testing this under qemu?
>=20
> (Especially the "more than 256 megs ram" part. :)

Hi Rob,

With the series applied you can start from malta_defconfig, enable
CONFIG_HIGHMEM, build your kernel then run QEMU like so:

  $ qemu-system-mipsel -kernel vmlinux -m 1G -append memsize=3D1G -serial s=
tdio

If you apply this patch to QEMU:

  https://www.mail-archive.com/qemu-devel@nongnu.org/msg297902.html

(or if you use a real board) then you can omit the memsize argument from
the kernel command line (ie. the -append) and just do:

  $ qemu-system-mipsel -kernel vmlinux -m 1G -serial stdio

The kernel will then retrieve the correct memory size from the
bootloader-provided environment and make use of all the available RAM.

Thanks,
    Paul

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJVYyO1AAoJENzvn0paErs5IoEP9A+/GJonjPcXdU4ISCC2jhSe
VLMFy+gR9WFGd+nd68J5imIaajXdSeOAeWRP4N7ryFnMBtgkx2BKm4XDAmvx0RFi
TobVMvEOhwQ83twetcc2e5yk7sMEt469ySVnRLy652lgeM0F6OBIFkwGNfAgaCVN
5BUyKuvt8KE5DaBUIZJ+FVgf0+X2/wvdwxYnEd/roZkBFvnSKLCmfkqBMlkNxNC/
0XRay7XBbArqlpw37G6dCqKbNcADOC7E5eJQwLVbtvF1DZ/Cxgr84yUG3DNEehbA
2yDw9ZV6meWqtXIao8yGsP/In8x/VFak/iN6xkbpz1WkXsy/35pYnY9Rz1ZvZbxB
aB9h1zlGO9gawkPqQNmL/SW2eRo2H+OrDiZV0eRLArx7nVGEvuBbv96juwn6N6KP
dR3fglBjWsk5P6FacnMcAyx0cRTyYt72Iw7Fl5g2jKnGmK9v8X/RSyQK8z5dyzT9
r0hcuH+L8KJ8u5u04z7kpcGTLOCMKEUebqzqZVzGdb/npBnrf2m1/DaDXbCST3p2
mS/3nmml7kPERZmFKRqb9LN51LmwZjSDynSS+oYRuRB22doAEPEZPSZlMCzEF1Wr
oBkq6RVymhmgr3LY7/EALw+X/EHR5HXBs3tPAH37y54ZD5MOME0PhQydKGDwsqxS
fPq0m+RALx9Y5ghGuXI=
=JaeJ
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
