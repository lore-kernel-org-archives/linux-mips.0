Received: from esa6.microchip.iphmx.com ([216.71.154.253]:4608 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990397AbeHaI6iunI34 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 31 Aug 2018 10:58:38 +0200
From: <Rene.Nielsen@microchip.com>
Subject: RE: [PATCH] MIPS: VDSO: Match data page cache colouring when D$
 aliases
Date: Fri, 31 Aug 2018 08:58:27 +0000
Message-ID: <CY4PR11MB0069B3A54A04467564CDA481990F0@CY4PR11MB0069.namprd11.prod.outlook.com>
References: <20180828160254.GC16561@piout.net>
 <20180830180121.25363-1-paul.burton@mips.com>
In-Reply-To: <20180830180121.25363-1-paul.burton@mips.com>
Content-Language: en-US
Content-Type: multipart/mixed;
        boundary="_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_"
MIME-Version: 1.0
Return-Path: <Rene.Nielsen@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: paul.burton@mips.com, alexandre.belloni@bootlin.com, hauke@hauke-m.de
Cc: linux-mips@linux-mips.org, jhogan@kernel.org, stable@vger.kernel.org
Message-ID: <20180831085827.cGWuE5E45NRsT6BLvldTzb8K471unvrv_I3d3HvGjXo@z>

--_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I have looked a bit more at this issue and found ways to reproduce and look=
ed
further at both James Hogan's and Paul Burton's patches.

--------------------------------------oOo----------------------------------=
----

The Problem
-----------

On our MIPS 24KEc, the dcache is 32 KBytes, 4-way and had Linux utilized a =
page
size of 8 Kbytes, we wouldn't have this dcache aliasing problem.

With a 4 Kbytes page size, however, it must be ensured that the color of
user-land pages is the same as the color of kernel-space pages when memory =
is
shared between the two.

In our case, this means that NOT only bits 11:0 (page-aligned) of the addre=
sses
must be identical, but also bit 12 (making them color-aligned).

In order to expose the problem, we must therefore attempt to have VDSO in k=
ernel
have a different page color than VDSO for the user-land mapping.

When a program loads, the first data that gets allocated is for glibc's loa=
der
(ld-2.27.so in our case), and the next thing that gets allocated is the two
pages needed for VDSO ([vvar] and [vdso]).

Therefore, the page color of user-space VDSO highly depends on the size of
the loader's requested data. In my original post
(https://www.linux-mips.org/archives/linux-mips/2017-06/msg00621.html), I w=
rote
that it started happening when compiling glibc with
'-fasynchronous-unwind-tables'. This may have changed the loader's data siz=
e to
go from an even number of pages to an odd number of pages or vice versa, th=
ereby
making the color of the subsequent VDSO user-space mapping likely to be
different from the kernel's.

A change in the linux kernel may also produce this, because of a change in =
page
color of the address where 'vdso_data' (declared in arch/mips/kernel/vdso.c=
)
starts.

For completeness, here's a snippet from the pagemap for some random process=
:

Section Name    Perm Virt Start Virt End   Virt Size  Phys Size
--------------- ---- ---------- ---------- ---------- ----------
...
                rwxp 0x77d04000 0x77d0e000      40960      36864
[vvar]          r--p 0x77d0e000 0x77d0f000       4096          0
[vdso]          r-xp 0x77d0f000 0x77d10000       4096       4096
/lib/ld-2.27.so r-xp 0x77d10000 0x77d11000       4096       4096
/lib/ld-2.27.so rwxp 0x77d11000 0x77d12000       4096       4096
[stack]         rwxp 0x7ff81000 0x7ffa2000     135168      28672

--------------------------------------oOo----------------------------------=
----

Modify kernel to provoke the issue
----------------------------------

In order to provoke the problem, we must first figure out whether the color=
 of
'vdso_data' in kernel-space is different from [vvar] in user-space.

The attached patch named 'vdso-chk-1.patch' prints the address of &vdso_dat=
a and
the corresponding user-land address and "aligned" if bit 12 are identical a=
nd
"NOT ALIGNED" if not.

If "aligned" is printed for all started processes, I suggest trying the att=
ached
patch named 'vdso-chk-2.patch'. This will declare a dummy variable in vdso.=
c
that will cause the linker to place vdso_data at a differently colored page=
.

--------------------------------------oOo----------------------------------=
----

Reproduce
---------

When the error is reproducible, you may want to attempt to provoke it.
I've attached a program, 'provoke.c', that will print to stderr whenever tw=
o
consecutive timestamps are received out of order from the kernel.

To increase the chance of errors to occur, the program must be instantiated
many times in parallel. The following shell command will create 50 simultan=
eous
instances of it:
    $ for i in $(seq 50); do provoke > /dev/null & done

An example of a snippet of the output when it goes wrong:
    ...
    [   46.926329] tgid =3D 171, pid =3D 171, comm =3D    timeofday: data_a=
ddr =3D 0x77f60000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    [   46.986344] tgid =3D 172, pid =3D 172, comm =3D    timeofday: data_a=
ddr =3D 0x77126000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    [   47.070821] tgid =3D 173, pid =3D 173, comm =3D    timeofday: data_a=
ddr =3D 0x7701c000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    [   47.090460] tgid =3D 170, pid =3D 170, comm =3D    timeofday: data_a=
ddr =3D 0x779c2000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    [   47.138366] tgid =3D 174, pid =3D 174, comm =3D    timeofday: data_a=
ddr =3D 0x77f60000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    [   47.166330] tgid =3D 175, pid =3D 175, comm =3D    timeofday: data_a=
ddr =3D 0x77406000, &vdso_data =3D 0x80525000, &dummy =3D 0x80524000 =3D> N=
OT ALIGNED
    tid =3D 126: Ran 10000 times. error_cnt =3D 0, success_cnt =3D 10000
    tid =3D 130: Ran 10000 times. error_cnt =3D 0, success_cnt =3D 10000
    Error: tid =3D 174: clock_gettime(): Prev =3D 56043, Cur =3D 53056, dif=
f =3D -2987
    Error: tid =3D 161: clock_gettime(): Prev =3D 56247, Cur =3D 53060, dif=
f =3D -3187
    Error: tid =3D 168: clock_gettime(): Prev =3D 56251, Cur =3D 53064, dif=
f =3D -3187
    Error: tid =3D 137: clock_gettime(): Prev =3D 56255, Cur =3D 53068, dif=
f =3D -3187
    Error: tid =3D 175: clock_gettime(): Prev =3D 56259, Cur =3D 53072, dif=
f =3D -3187
    Error: tid =3D 129: clock_gettime(): Prev =3D 56263, Cur =3D 53076, dif=
f =3D -3187
    tid =3D 129: Ran 10000 times. error_cnt =3D 1, success_cnt =3D 9999
    Error: tid =3D 155: clock_gettime(): Prev =3D 56267, Cur =3D 53078, dif=
f =3D -3189
    Error: tid =3D 165: clock_gettime(): Prev =3D 56271, Cur =3D 53080, dif=
f =3D -3191
    ...

--------------------------------------oOo----------------------------------=
----

Trying out James Hogan's patch
------------------------------

With the error-producing version of vdso-chk-X.patch applied, apply James'
patch and run the 'provoke' program again.

This works since kernel- and user-space coloring always becomes identical.

--------------------------------------oOo----------------------------------=
----

Trying out Paul Burton's patch
------------------------------

With the error-producing version of vdso-chk-X.patch applied, apply Paul's =
patch
and run the 'provoke' program again.

This also works.

Paul's patch allocates twice the amount of needed VM, but I guess that's fi=
ne,
as it's also less intrusive (no changes to mmap.c).

Regards,
Ren=E9 Nielsen

-----Original Message-----
From: Paul Burton [mailto:paul.burton@mips.com]=20
Sent: 30. august 2018 20:01
To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Rene Nielsen <rene.n=
ielsen@microsemi.com>; Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mips@linux-mips.org; Paul Burton <paul.burton@mips.com>; James Ho=
gan <jhogan@kernel.org>; stable@vger.kernel.org
Subject: [PATCH] MIPS: VDSO: Match data page cache colouring when D$ aliase=
s

EXTERNAL EMAIL


When a system suffers from dcache aliasing a user program may observe stale=
 VDSO data from an aliased cache line. Notably this can break the expectati=
on that clock_gettime(CLOCK_MONOTONIC, ...) is, as its name suggests, monot=
onic.

In order to ensure that users observe updates to the VDSO data page as inte=
nded, align the user mappings of the VDSO data page such that their cache c=
olouring matches that of the virtual address range which the kernel will us=
e to update the data page - typically its unmapped address within kseg0.

This ensures that we don't introduce aliasing cache lines for the VDSO data=
 page, and therefore that userland will observe updates without requiring c=
ache invalidation.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Reported-by: Hauke Mehrtens <hauke@hauke-m.de>
Reported-by: Rene Nielsen <rene.nielsen@microsemi.com>
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: stable@vger.kernel.org # v4.4+
---
Hi Alexandre,

Could you try this out on your Ocelot system? Hopefully it'll solve the pro=
blem just as well as James' patch but doesn't need the questionable change =
to arch_get_unmapped_area_common().

Thanks,
    Paul
---
 arch/mips/kernel/vdso.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c index 019035=
d7225c..5fb617a42335 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
+#include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -20,6 +21,7 @@

 #include <asm/abi.h>
 #include <asm/mips-cps.h>
+#include <asm/page.h>
 #include <asm/vdso.h>

 /* Kernel-provided data used by the VDSO. */ @@ -128,12 +130,30 @@ int arc=
h_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
        vvar_size =3D gic_size + PAGE_SIZE;
        size =3D vvar_size + image->size;

+       /*
+        * Find a region that's large enough for us to perform the
+        * colour-matching alignment below.
+        */
+       if (cpu_has_dc_aliases)
+               size +=3D shm_align_mask + 1;
+
        base =3D get_unmapped_area(NULL, 0, size, 0, 0);
        if (IS_ERR_VALUE(base)) {
                ret =3D base;
                goto out;
        }

+       /*
+        * If we suffer from dcache aliasing, ensure that the VDSO data pag=
e is
+        * coloured the same as the kernel's mapping of that memory. This
+        * ensures that when the kernel updates the VDSO data userland will=
 see
+        * it without requiring cache invalidations.
+        */
+       if (cpu_has_dc_aliases) {
+               base =3D __ALIGN_MASK(base, shm_align_mask);
+               base +=3D ((unsigned long)&vdso_data - gic_size) & shm_alig=
n_mask;
+       }
+
        data_addr =3D base + gic_size;
        vdso_addr =3D data_addr + PAGE_SIZE;

--
2.18.0


--_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_
Content-Type: application/octet-stream; name="vdso-chk-1.patch"
Content-Description: vdso-chk-1.patch
Content-Disposition: attachment; filename="vdso-chk-1.patch"; size=725;
	creation-date="Fri, 31 Aug 2018 08:52:34 GMT";
	modification-date="Fri, 31 Aug 2018 08:43:30 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvdmRzby5jIGIvYXJjaC9taXBzL2tlcm5lbC92
ZHNvLmMKaW5kZXggZjlkYmZiMS4uNjE2ZmVmNCAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5l
bC92ZHNvLmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC92ZHNvLmMKQEAgLTE4MSw2ICsxODEsMTcg
QEAgaW50IGFyY2hfc2V0dXBfYWRkaXRpb25hbF9wYWdlcyhzdHJ1Y3QgbGludXhfYmlucHJtICpi
cHJtLCBpbnQgdXNlc19pbnRlcnApCiAJcmV0ID0gMDsKIAogb3V0OgorCXsKKwkJdW5zaWduZWQg
bG9uZyBkID0gZGF0YV9hZGRyICAmIDB4MDAwMDEwMDBMVTsKKwkJdW5zaWduZWQgbG9uZyB2ID0g
KHVuc2lnbmVkIGxvbmcpJnZkc29fZGF0YSAmIDB4MDAwMDEwMDBMVTsKKworCQkvKiBCaXQgMTIg
bXVzdCBiZSBpZGVudGljYWwgaW4gdXNlci0gYW5kIGtlcm5lbC1zcGFjZSAqLworCQlwcmludGso
S0VSTl9FUlIgInRnaWQgPSAldSwgcGlkID0gJXUsIGNvbW0gPSAlMTJzOiBkYXRhX2FkZHIgPSAi
CisJCQkiMHglMDhseCwgJnZkc29fZGF0YSA9IDB4JXAgPT4gJXNcbiIsCisJCQljdXJyZW50LT50
Z2lkLCBjdXJyZW50LT5waWQsIGN1cnJlbnQtPmNvbW0sIGRhdGFfYWRkciwKKwkJCSZ2ZHNvX2Rh
dGEsIGQgPT0gdiA/ICJhbGlnbmVkIiA6ICJOT1QgQUxJR05FRCIpOworICAgICAgICB9CisKIAl1
cF93cml0ZSgmbW0tPm1tYXBfc2VtKTsKIAlyZXR1cm4gcmV0OwogfQo=

--_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_
Content-Type: application/octet-stream; name="vdso-chk-2.patch"
Content-Description: vdso-chk-2.patch
Content-Disposition: attachment; filename="vdso-chk-2.patch"; size=1116;
	creation-date="Fri, 31 Aug 2018 08:52:45 GMT";
	modification-date="Fri, 31 Aug 2018 08:43:21 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvdmRzby5jIGIvYXJjaC9taXBzL2tlcm5lbC92
ZHNvLmMKaW5kZXggZjlkYmZiMS4uNjI5NTJhZSAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5l
bC92ZHNvLmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC92ZHNvLmMKQEAgLTI0LDYgKzI0LDcgQEAK
IAogLyogS2VybmVsLXByb3ZpZGVkIGRhdGEgdXNlZCBieSB0aGUgVkRTTy4gKi8KIHN0YXRpYyB1
bmlvbiBtaXBzX3Zkc29fZGF0YSB2ZHNvX2RhdGEgX19wYWdlX2FsaWduZWRfZGF0YTsKK3N0YXRp
YyB1bmlvbiBtaXBzX3Zkc29fZGF0YSBkdW1teSAgICAgX19wYWdlX2FsaWduZWRfZGF0YTsKIAog
LyoKICAqIE1hcHBpbmcgZm9yIHRoZSBWRFNPIGRhdGEvR0lDIHBhZ2VzLiBUaGUgcmVhbCBwYWdl
cyBhcmUgbWFwcGVkIG1hbnVhbGx5LCBhcwpAQCAtMTgxLDYgKzE4MiwyMiBAQCBpbnQgYXJjaF9z
ZXR1cF9hZGRpdGlvbmFsX3BhZ2VzKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIGludCB1c2Vz
X2ludGVycCkKIAlyZXQgPSAwOwogCiBvdXQ6CisJeworCQl1bnNpZ25lZCBsb25nIGQgPSBkYXRh
X2FkZHIgICYgMHgwMDAwMTAwMExVOworCQl1bnNpZ25lZCBsb25nIHYgPSAodW5zaWduZWQgbG9u
ZykmdmRzb19kYXRhICYgMHgwMDAwMTAwMExVOworCisJCS8qCisJCSAqIE1ha2Ugc3VyZSB3ZSB1
c2UgI2R1bW15IGZvciBzb21ldGhpbmcgb3IgdGhlIGxpbmtlciB3aWxsCisJCSAqIGRpc2NhcmQg
aXQuCisJCSAqLworCisJCS8qIEJpdCAxMiBtdXN0IGJlIGlkZW50aWNhbCBpbiB1c2VyLSBhbmQg
a2VybmVsLXNwYWNlICovCisJCXByaW50ayhLRVJOX0VSUiAidGdpZCA9ICV1LCBwaWQgPSAldSwg
Y29tbSA9ICUxMnM6IGRhdGFfYWRkciA9ICIKKwkJCSIweCUwOGx4LCAmdmRzb19kYXRhID0gMHgl
cCwgJmR1bW15ID0gMHglcCA9PiAlc1xuIiwKKwkJCWN1cnJlbnQtPnRnaWQsIGN1cnJlbnQtPnBp
ZCwgY3VycmVudC0+Y29tbSwgZGF0YV9hZGRyLAorCQkJJnZkc29fZGF0YSwgJmR1bW15LCBkID09
IHYgPyAiYWxpZ25lZCIgOiAiTk9UIEFMSUdORUQiKTsKKyAgICAgICAgfQorCiAJdXBfd3JpdGUo
Jm1tLT5tbWFwX3NlbSk7CiAJcmV0dXJuIHJldDsKIH0K

--_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_
Content-Type: text/plain; name="provoke.c"
Content-Description: provoke.c
Content-Disposition: attachment; filename="provoke.c"; size=1548;
	creation-date="Fri, 31 Aug 2018 08:53:52 GMT";
	modification-date="Fri, 31 Aug 2018 08:53:08 GMT"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0ZGludC5o
PgojaW5jbHVkZSA8dGltZS5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdHJpbmcu
aD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN5cy9z
eXNjYWxsLmg+CiNpbmNsdWRlIDxpbnR0eXBlcy5oPgoKLy8gZm9yIGkgaW4gJChzZXEgNTApOyBk
byBwcm92b2tlID4gL2Rldi9udWxsICYgZG9uZQoKc3RhdGljIHZvbGF0aWxlIGludCBydW4gPSAx
OwoKc3RhdGljIHZvaWQgY3RybF9jX2hhbmRsZXIoaW50IHNpZykKewogICAgcnVuID0gMDsKfQoK
c3RhdGljIHVpbnQ2NF90IG1pbGxpc2Vjb25kcyh2b2lkKQp7CiAgICBzdHJ1Y3QgdGltZXNwZWMg
dGltZTsKICAgIGlmIChjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnRpbWUpID09IDAp
IHsKICAgICAgICByZXR1cm4gKCh1aW50NjRfdCl0aW1lLnR2X3NlYyAqIDEwMDBVTEwpICsgKHRp
bWUudHZfbnNlYyAvIDEwMDAwMDApOwogICAgfQoKICAgIGZwcmludGYoc3RkZXJyLCAiY2xvY2tf
Z2V0dGltZSgpIGZhaWxlZDogJXNcbiIsIHN0cmVycm9yKGVycm5vKSk7CiAgICBleGl0KC0xKTsK
fQoKaW50IG1haW4odm9pZCkKewogICAgdWludDMyX3QgaSwgZXJyb3JfY250ID0gMDsKICAgIHVp
bnQ2NF90IHByZXZfdGltZSA9IDA7CiAgICBpbnQgICAgICB0aWQgPSBzeXNjYWxsKFNZU19nZXR0
aWQpOwoKICAgIHNpZ25hbChTSUdJTlQsIGN0cmxfY19oYW5kbGVyKTsKCiAgICBmb3IgKGkgPSAw
OyBpIDwgMTAwMDAgJiYgcnVuOyBpKyspIHsKICAgICAgICB1aW50NjRfdCBjdXJfdGltZSA9IG1p
bGxpc2Vjb25kcygpOwoKICAgICAgICBpZiAoY3VyX3RpbWUgPCBwcmV2X3RpbWUpIHsKICAgICAg
ICAgICAgZXJyb3JfY250Kys7CiAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRXJyb3I6IHRp
ZCA9ICVkOiBjbG9ja19nZXR0aW1lKCk6IFByZXYgPSAlIiBQUkl1NjQKCSAgICAgICAgICAgICIs
IEN1ciA9ICUiIFBSSXU2NCAiLCBkaWZmID0gLSUiIFBSSXU2NCAiXG4iLAoJCSAgICB0aWQsIHBy
ZXZfdGltZSwgY3VyX3RpbWUsIHByZXZfdGltZSAtIGN1cl90aW1lKTsKICAgICAgICB9IGVsc2Ug
ewogICAgICAgICAgICBmcHJpbnRmKHN0ZG91dCwgIkluZm86ICB0aWQgPSAlZDogY2xvY2tfZ2V0
dGltZSgpOiBQcmV2ID0gJSIgUFJJdTY0CgkgICAgICAgICAgICAiLCBDdXIgPSAlIiBQUkl1NjQg
IiwgZGlmZiA9ICAlIiBQUkl1NjQgIlxuIiwKCQkgICAgdGlkLCBwcmV2X3RpbWUsIGN1cl90aW1l
LCBjdXJfdGltZSAtIHByZXZfdGltZSk7CiAgICAgICAgfQoKICAgICAgICBwcmV2X3RpbWUgPSBj
dXJfdGltZTsKICAgIH0KCiAgICBmcHJpbnRmKHN0ZGVyciwgInRpZCA9ICVkOiBSYW4gJXUgdGlt
ZXMuIGVycm9yX2NudCA9ICV1LCBzdWNjZXNzX2NudCA9ICV1XG4iLAogICAgICAgICAgICB0aWQs
IGksIGVycm9yX2NudCwgaSAtIGVycm9yX2NudCk7CgogICAgcmV0dXJuIGVycm9yX2NudCA/IC0x
IDogMDsKfQoK

--_004_CY4PR11MB0069B3A54A04467564CDA481990F0CY4PR11MB0069namp_--
