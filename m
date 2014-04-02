Received: from [217.156.133.130] ([217.156.133.130]:42912 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-FAIL-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6822276AbaDBKZXs2Wry (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Apr 2014 12:25:23 +0200
Message-ID: <533BE58C.3010201@imgtec.com>
Date: Wed, 2 Apr 2014 11:25:16 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: MT: proc: Add support for printing VPE and TC ids
References: <1381846382-26437-1-git-send-email-markos.chandras@imgtec.com> <20131016151007.GP1615@linux-mips.org>
In-Reply-To: <20131016151007.GP1615@linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="ODU5mEL8qOehS9dJvAdKovWJ0JlscXvH7"
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20140402102516.QQr-GotZuRprJr6t0TagZIEQgyRaieLiuSK50SH2Jd0@z>

--ODU5mEL8qOehS9dJvAdKovWJ0JlscXvH7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 16/10/13 16:10, Ralf Baechle wrote:
> On Tue, Oct 15, 2013 at 03:13:02PM +0100, Markos Chandras wrote:
>=20
>> Add support for including VPE and TC ids in /proc/cpuinfo output as
>> appropriate when MT/SMTC is enabled.
>=20
> The pile of #ifdefs cracked my glasses ...
>=20
> And there are more CPUs or configuration that want to provide special
> per-CPU information in /proc/cpuinfo.  So I think there needs to be a
> hook mechanism, such as a notifier.
>=20
> This is a first cut only; I need to think about what sort of looking
> the notifier needs to have.  But I'd appreciate testing on MT hardware!=

>=20
> Thanks,
>=20
>   Ralf
>=20
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Hi Ralf,

Both of these patches seem to be applied, Markos' in v3.14-rc1, and your
one in mips-for-linux-next:

$ cat /proc/cpuinfo
=2E..
processor               : 3
=2E..
core                    : 1
VPE                     : 1
VCED exceptions         : not available
VCEI exceptions         : not available
VPE                     : 1

Maybe a revert of Markos' patch could be squashed in to your patch?

Cheers
James

>=20
>  arch/mips/include/asm/cpu-info.h | 21 +++++++++++++++++++++
>  arch/mips/kernel/proc.c          | 23 +++++++++++++++++++++++
>  arch/mips/kernel/smp-mt.c        | 22 ++++++++++++++++++++++
>  arch/mips/kernel/smtc-proc.c     | 23 +++++++++++++++++++++++
>  4 files changed, 89 insertions(+)
>=20
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/c=
pu-info.h
> index 21c8e29..95c1c42 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -92,4 +92,25 @@ extern void cpu_report(void);
>  extern const char *__cpu_name[];
>  #define cpu_name_string()	__cpu_name[smp_processor_id()]
> =20
> +struct seq_file;
> +struct notifier_block;
> +
> +extern int register_proc_cpuinfo_notifier(struct notifier_block *nb);
> +extern int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v=
);
> +
> +#define proc_cpuinfo_notifier(fn, pri)					\
> +({									\
> +	static struct notifier_block fn##_nb =3D {			\
> +		.notifier_call =3D fn,					\
> +		.priority =3D pri						\
> +	};								\
> +									\
> +	register_proc_cpuinfo_notifier(&fn##_nb);			\
> +})
> +
> +struct proc_cpuinfo_notifier_args {
> +	struct seq_file *m;
> +	unsigned long n;
> +};
> +
>  #endif /* __ASM_CPU_INFO_H */
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 8c58d8a..5ca804d 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -17,8 +17,24 @@
> =20
>  unsigned int vced_count, vcei_count;
> =20
> +/*
> + *  * No lock; only written during early bootup by CPU 0.
> + *   */
> +static RAW_NOTIFIER_HEAD(proc_cpuinfo_chain);
> +
> +int __ref register_proc_cpuinfo_notifier(struct notifier_block *nb)
> +{
> +	return raw_notifier_chain_register(&proc_cpuinfo_chain, nb);
> +}
> +
> +int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v)
> +{
> +	return raw_notifier_call_chain(&proc_cpuinfo_chain, val, v);
> +}
> +
>  static int show_cpuinfo(struct seq_file *m, void *v)
>  {
> +	struct proc_cpuinfo_notifier_args proc_cpuinfo_notifier_args;
>  	unsigned long n =3D (unsigned long) v - 1;
>  	unsigned int version =3D cpu_data[n].processor_id;
>  	unsigned int fp_vers =3D cpu_data[n].fpu_id;
> @@ -112,6 +128,13 @@ static int show_cpuinfo(struct seq_file *m, void *=
v)
>  		      cpu_has_vce ? "%u" : "not available");
>  	seq_printf(m, fmt, 'D', vced_count);
>  	seq_printf(m, fmt, 'I', vcei_count);
> +
> +	proc_cpuinfo_notifier_args.m =3D m;
> +	proc_cpuinfo_notifier_args.n =3D n;
> +
> +	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
> +				&proc_cpuinfo_notifier_args);
> +
>  	seq_printf(m, "\n");
> =20
>  	return 0;
> diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
> index 57a3f7a..9a43e78 100644
> --- a/arch/mips/kernel/smp-mt.c
> +++ b/arch/mips/kernel/smp-mt.c
> @@ -285,3 +285,25 @@ struct plat_smp_ops vsmp_smp_ops =3D {
>  	.smp_setup		=3D vsmp_smp_setup,
>  	.prepare_cpus		=3D vsmp_prepare_cpus,
>  };
> +
> +static int proc_cpuinfo_chain_call(struct notifier_block *nfb,
> +	unsigned long action_unused, void *data)
> +{
> +	struct proc_cpuinfo_notifier_args *pcn =3D data;
> +	struct seq_file *m =3D pcn->m;
> +	unsigned long n =3D pcn->n;
> +
> +	if (!cpu_has_mipsmt)
> +		return NOTIFY_OK;
> +
> +	seq_printf(m, "VPE\t\t\t: %d\n", cpu_data[n].vpe_id);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int __init proc_cpuinfo_notifier_init(void)
> +{
> +	return proc_cpuinfo_notifier(proc_cpuinfo_chain_call, 0);
> +}
> +
> +subsys_initcall(proc_cpuinfo_notifier_init);
> diff --git a/arch/mips/kernel/smtc-proc.c b/arch/mips/kernel/smtc-proc.=
c
> index c10aa84..38635a9 100644
> --- a/arch/mips/kernel/smtc-proc.c
> +++ b/arch/mips/kernel/smtc-proc.c
> @@ -77,3 +77,26 @@ void init_smtc_stats(void)
> =20
>  	proc_create("smtc", 0444, NULL, &smtc_proc_fops);
>  }
> +
> +static int proc_cpuinfo_chain_call(struct notifier_block *nfb,
> +	unsigned long action_unused, void *data)
> +{
> +	struct proc_cpuinfo_notifier_args *pcn =3D data;
> +	struct seq_file *m =3D pcn->m;
> +	unsigned long n =3D pcn->n;
> +
> +	if (!cpu_has_mipsmt)
> +		return NOTIFY_OK;
> +
> +	seq_printf(m, "VPE\t\t\t: %d\n", cpu_data[n].vpe_id);
> +	seq_printf(m, "TC\t\t\t: %d\n", cpu_data[n].tc_id);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int __init proc_cpuinfo_notifier_init(void)
> +{
> +	return proc_cpuinfo_notifier(proc_cpuinfo_chain_call, 0);
> +}
> +
> +subsys_initcall(proc_cpuinfo_notifier_init);
>=20


--ODU5mEL8qOehS9dJvAdKovWJ0JlscXvH7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAEBAgAGBQJTO+WMAAoJEGwLaZPeOHZ6ygQQAKgTL9mkITkfVp2mi6pZgqhR
Hn9u2u87KqenSkJG1IGARPcyCmL5Nui8jeS/IQgYDn/9/5faD2j6uZz4ZFlcmqUo
zb3lunMjPUvDCERpi/0AX9uKoaciIGBB9dP6o/ScZelRogJAqrBGo9GLmRFOL/PD
jyALjIXRbMuHdhEDkrIqhOVgx/WW0PbmBBVo3R8r4brJqssmdAVFBjIRcpPwAavi
c/tun5VJylNv3tKmIZ3Sm+4/TOHS2ji0AKiSWBYEEJsVavAe9WI5UOGsPWDyFUhi
Y/f6qbfjEXW5e8Y9K5C53afZxhrgGw9Oo+LQw9YDWSdr+rn5TY2FWbwvJqoq1MSl
LHI3/jW1NotqAVvbsj/UpMJTmBAP110oJbXVB+5ZnEdCMp43wH/Cqqf5rwseNygG
r+r3ZtjpoDdjwOoV0ScCcaDkd61nh9iGfPIzbT9zaGmW7awaTlgTpdLkT1Bw3g1p
LdG4nCjKdwxqJg76CNaK2e0AMAsxf3SZLw6/U7pLHrAqXZZ4Kajk3b7w9R5qJfAp
pIA027TG7v6W8h1jdBX9ygKEpwugiiBMXxLLq/nt4O8ck9biS2RtjHLW5Rz1V8je
8HqDORSQDwut2LdgmBHbBXYZ8XjtZY8xp3O7O4YGB2kmmJOi3mFHzLek5z/EYvrT
MimrdjWZHdsu0DHT7ju5
=Ewd3
-----END PGP SIGNATURE-----

--ODU5mEL8qOehS9dJvAdKovWJ0JlscXvH7--
