Date: Sat, 23 Feb 2002 00:11:22 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: R3k and swap: Still no go?
Message-ID: <20020223001122.F15503@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline
Sender: owner-linux-mips@oss.sgi.com
To: Linux-MIPS <linux-mips@oss.sgi.com>
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Message-ID: <20020222231122.F6lcH4fmC4rs6AYY-38rtHoDYzDma9vZctnsxsmZZ7w@z>


--FUFe+yI/t+r3nyH4
Content-Type: multipart/mixed; boundary="a8sldprk+5E/pDEv"
Content-Disposition: inline


--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

A year or two ago we've had a thread about r3k and swap. Currently,
the box will oops... There's a patch changing some magic numbers
in include/asm-mips/pgtable.h (attached against current CVS), but
it is not really acceptable: some numbers are changed but nobody
seems to know *what* this does mean. Ralf even mentioned that there
might be some bug in the whole paging mechanism hiding behind this.

Flo looked into this and his resume was that even the current
(oopsing) values *should* do the job IIRC. Maciej, do you have
a hint on this? I'm now using this patch, because it does make
the kernel useable, but I don't understand why...

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=swap-diff
Content-Transfer-Encoding: quoted-printable

--- linux/include/asm-mips/pgtable.h	2002/02/07 02:39:15	1.68
+++ linux/include/asm-mips/pgtable.h	2002/02/22 22:01:24
@@ -518,9 +518,16 @@
 extern void update_mmu_cache(struct vm_area_struct *vma,
 				unsigned long address, pte_t pte);
=20
-#define SWP_TYPE(x)		(((x).val >> 1) & 0x3f)
-#define SWP_OFFSET(x)		((x).val >> 8)
-#define SWP_ENTRY(type,offset)	((swp_entry_t) { ((type) << 1) | ((offset) =
<< 8) })
+#ifndef CONFIG_CPU_R3000
+#	define SWP_TYPE(x)		(((x).val >> 1) & 0x3f)
+#	define SWP_OFFSET(x)		((x).val >> 8)
+#	define SWP_ENTRY(type,offset)	((swp_entry_t) { ((type) << 1) | ((offset)=
 << 8) })
+#else /* CONFIG_CPU_R3000 */
+#	define SWP_TYPE(x)			(((x).val >> 8) & 0x7f)
+#	define SWP_OFFSET(x)			((x).val >> 15)
+#	define define SWP_ENTRY(type,offset)	((swp_entry_t) { ((type) << 8) | ((=
offset) << 15) })
+#endif
+
 #define pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define swp_entry_to_pte(x)	((pte_t) { (x).val })
=20

--a8sldprk+5E/pDEv
Content-Type: message/rfc822
Content-Description: Flo's statement
Content-Disposition: attachment; filename="resumee.mbox"



--a8sldprk+5E/pDEv--

--FUFe+yI/t+r3nyH4--
