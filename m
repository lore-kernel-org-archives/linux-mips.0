Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF223F0AAC
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003399; cv=none; b=WD+P6dIZQP4dt8fNSK0LyBazE3olYW37n0Ef14JuQs7sQCYL2EAdFNLvrn2ZwwyGvIFDfISUSrfIimDSuhjisQmNvezxKGExQK2mbSZ+bbQbgeNqVJ0hdlxrVrWjBwD5yD3WIHzaQKba/rQGZ8xkHuqRRZam47rrEwf3tKvZtXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003399; c=relaxed/simple;
	bh=w12UJCXmoPgOejvC7+pwZJ5tYzsSXZ0zhjRwU9QoS48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ke57vJJchPzx0fZlXye2UMuc3wKTcY1SnxdXY+vkFj1pIPgKBS6LpIc9V6+jQsdxPSMZyZBauUTipN/7nb/2jS+bbXhFpAuVtaGlAcsCFvZHAKUamZCElhG7LOzBtCXMLuSevwCvJCStjSmwbWEihOxgbzd22du/t7uvdpV9p1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrvI99d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQgaaGtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrvI99d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQgaaGtr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpigo1672397
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 18:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=; b=BrvI99d/BJFRtfGD
	c1QyR5/4QEJFXnDqRPXcOC7jZq+ocFtb3+eGk078xSQz9QRw13GrAqxI2XXcwSZ8
	SQdR7JdXJn/KcFZaJ699XFGGQpU4GeX6MKNLk2ujMURbp3KZpWxbeDTdM6qZlYuB
	rPqN3zBUEQBK/h7QmXMGYuwXpo2Lr3nQLAxk20zM3XfupN+VWM9blPVUMpu2lr8U
	goBpxoIOidFPNo2PSnmOYZupNrTy+N+xKMYIMwQURhdSWfSVPqJtxjKTuhtImUIQ
	NA+OrINS/+bhBemyfZQ9PxRfRWIYYbfMGArKAyfzcqdn/2PGpowBPv+aPc3SoLrg
	MQgwBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh8p7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 18:43:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so266466885a.1
        for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792003395; x=1792608195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=;
        b=DQgaaGtrhprq29zxbrADbg2yLUXfQh+cND0rRQ57EPbjjlBwvjz7GjWyAjbUCm6jRU
         bz86uoBYKCPWyoKlorRKWxUv5jqBTxCSwH880XYtUztXUyP8tEtnv7mNlQjFVW9iWdTk
         aIoNtr6Fj/mrwTve8sOIDIKLzfs3lSScErrWqb46h/v3XBBa7Bqg34Mu7kJjstSgIFby
         LLRkEUkRHT3FkCLztYaQuj87i4dLGLGnyoArNfUaCIfO95xkwDqM8J23P/DsWkR2MUJw
         KJalXE5ngudSdtB8+k7vSvPbltJZa5wrhE2dr640pIz8t+l7jdmWrETJ93uBFRAx8Hon
         Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003395; x=1792608195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0B3rQH0JRJrNGJlm78wyMsk4h4oAZUsILKGncMUfG0=;
        b=u/PxO/b17/JQ0CPjj91yQpl2mw0OT9UhBD7eihe12Sg+eYtixjrxUnbH5NL6GzizSx
         +Ryz+APOnY4kEt7/Bde1Bi++12IKoZxbV7DASaFnMzGqjKVExki39fYroe2lgEbMdayq
         jN2gom7djN7lQ35CbeTxKDVQauN2aAAw48/44oJnpAwsWBO6xEkBkenyWJ/+iJgX1VUS
         +sDVkN1RkQAEd5/FFt2odoP7Yw3huTwhftsN+q+P/AwUsi1A3dvCf+RdWxcXj2iLxljt
         cUN9PNv4BQJcyVhAYGpSJUU55ESv8vA2nloj/33TGs97j3LWNvrrdwmEeXA1XJApluD1
         qPqQ==
X-Forwarded-Encrypted: i=1; AKwUvByRkjwFUJuP/+UxqGKTsz3yzqqenrATPcES50tu6INB/vwuxLEspJJh8mteqNjpntcFSl7r/YzCMPS0@vger.kernel.org
X-Gm-Message-State: AFq9FYKvXbFsBNqWbC/fHHzsSH+adP+Vuxa2QJLBGE6h1qKKfBIuiP1U
	3wdb0gF4MbvOAvoHMAzZk+xV69DOrpF6Qy7wPBA/VDYL9bScHqd4H2pmOgLUtWYHl/FPux2u0tH
	ev5xaFhTgCwFQgNSHn1t9khBgc9N0iAlSBF6oLskmTYcx8p+A8Opz7kio/4PWYUCk
X-Gm-Gg: AYBFou3x04nVmzwBiCEcGNeEDwHDCk92CUBEClzYN6puG6zXghSn7RUi8mDATXhb5i0
	4vxiNX7v1CuD+5ZJQ2dtVME+Eu+FNXa4biFlVMwSTI5M5V2+02raU+fvRQ7pYcgrWOv3GSzGf0o
	1tf4m78UDL2Zv44J0Ffkyvs+TADCm9fZ7iaxoLUNACUHC477SnD2rgg15TuuR/7UdP6vwUD7esH
	jciz01mXGiWz5W413OwAeVLTVoiJkOUQH6sGIR4K1PgRBEs/gHPx6ENmNMD2N/LM3ouBiykVfjT
	Zechr0pzYHbE1+PzBqavFsvXAlxIPLs7HqGvzWesmgao0LqxKX13OYNFmbHgN5vcC9YEZm0hp+W
	hXx/NF4Kd7mizwk/D6Y5Fp7YNulpYk4AvGSWL8jz+IWNYzBgFP5QI0knPRj7eIQ==
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2765570885a.13.1792003395259;
        Wed, 14 Oct 2026 11:43:15 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2765566685a.13.1792003394607;
        Wed, 14 Oct 2026 11:43:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm19308895e9.12.2026.10.14.11.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:43:13 -0700 (PDT)
Message-ID: <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 20:43:12 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org, naseefkm@gmail.com,
        robh@kernel.org, tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918153606.344143-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Tx3EuQbO_Z7gVccrkTLd3EsZuJ0QiU5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfX1018QbBQVfkp
 ZY9tQv3Vw2bOaZTtkcdUM7ZwH+Rij3DLNYMyBN7ZhOAhzGStAyJ79D7Qm2Fm9Kp4u3alLt2SIlQ
 dr/1jVGUfdm6UV6CfIBh3leKyi73EZ8=
X-Proofpoint-GUID: 8Tx3EuQbO_Z7gVccrkTLd3EsZuJ0QiU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfX6OJRBsPQV0fV
 TJUhVtqmwgEjQFU56pqBmhxPrjXWGLFA2Yw/DTEGRvNHu9iemt1wdKGWz0F4FIJDhyKwTjDbMZO
 pyIzovK+dQSV9qYhxOmto/k3Z0oyEN9st0/cSnxWlSapfR4L7StVk1Q20AtDkIy5sf85vfeXzGm
 KfzH0sBCzMeMpHsyg3c2AZLqn1v1q8VxNehKdy2XWOp+JdacYjdKhT/pdS788gxBf2f1qz4KLNL
 Qce/OOAgGiysiBioEt3xqmowehqc7uiayOtb5TrZej6aOFW/n0bTDIhFvbDWkgQPk4or2A0WHeZ
 DjxGneyJXhPcSTqa+8cyd5ScwLTzDDQzH9d86LkEsPYOK6HLAdacJ4loYnbk2DjsIV0qMy8zx7h
 zJ22T34GCYvR2jABruUOuS80Hr4jluvJ/I8cpInZnXLCsbxbOOZDIFye6hGCF5q23rC8jyedRnC
 bGofy2fQMCbZ3UgXplA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfcd44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qzuFoDSjp3ydXB7kr3YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140074


Hi Caleb,

with the help of a LLM, I got the following two issues with the changes

On 9/18/26 17:36, Caleb James DeLisle wrote:
> EN751627 is based on the 1004Kc which uses a different interrupt number
> for each CPU timer. Support both this and the EN751221 which uses a
> single percpu interrupt.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   drivers/clocksource/timer-econet-en751221.c | 122 ++++++++++++++++----
>   1 file changed, 99 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
> index f2c4c1ee0a56..ff86a7edd31d 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -21,10 +21,12 @@
>   #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
>   /* 34Kc hardware has 1 block and 1004Kc has 2. */
>   #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
> +#define ECONET_NUM_IRQS			NR_CPUS
>   
>   static struct {
>   	void __iomem	*membase[ECONET_NUM_BLOCKS];
> -	int		irq;
> +	int		irqs[ECONET_NUM_IRQS];
> +	bool		is_percpu;
>   	u32		freq_hz;
>   } econet_timer __ro_after_init;
>   
> @@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
>   	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
>   	u32 reg;
>   
> +	if (!reg_ctl(cpu)) {
> +		pr_err("%s: missing address resource for CPU %d\n", cd->name,
> +		       cpu);
> +		return -EINVAL;
> +	}
> +	if (cd->irq <= 0) {
> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
> +		return -EINVAL;
> +	}
> +	if (!econet_timer.is_percpu) {
> +		int ret = irq_force_affinity(cd->irq, cpumask_of(cpu));
> +
> +		if (ret) {
> +			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
> +			       cd->name, cpu, ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
>   	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
>   
>   	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>   	clockevents_config_and_register(cd, econet_timer.freq_hz,
>   					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
>   
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

The new path calls enable_irq() each time a CPU starts, but the hotplug 
state has no teardown callback to disable it. After an offline/online 
cycle, the next enable_irq() encounters depth zero and warns about an 
unbalanced enable.
The IRQ also remains eligible for migration when its CPU goes offline. 
Since cevt_interrupt() selects the timer using this_cpu_ptr(), an 
interrupt migrated to another CPU checks and acknowledges that CPU’s 
timer rather than the source timer, potentially leaving the source 
interrupt asserted.
Add a CPU-offline callback that masks the CPU’s timer interrupt and 
balances enable_irq() with disable_irq_nosync() before migration.

>   	return 0;
>   }
> @@ -141,19 +165,52 @@ static void __init cevt_init(struct device_node *np)
>   					  CLOCK_EVT_FEAT_C3STOP |
>   					  CLOCK_EVT_FEAT_PERCPU;
>   		cd->set_next_event	= cevt_set_next_event;
> -		cd->irq			= econet_timer.irq;
> +
> +		if (econet_timer.is_percpu)
> +			cd->irq = econet_timer.irqs[0];
> +		else
> +			cd->irq = econet_timer.irqs[i];
> +
>   		cd->cpumask		= cpumask_of(i);
>   		cd->name		= np->name;
>   
> -		cevt_dev_init(i);
> +		/*
> +		 * Tolerate CPUs that could exist but don't.
> +		 * Fail in cevt_init_cpu when they try to start.
> +		 */
> +		if (reg_ctl(i))
> +			cevt_dev_init(i);
>   	}
>   }
>   
>   static int __init timer_init(struct device_node *np)
>   {
> -	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks = of_address_count(np);
> +	int num_irqs = of_irq_count(np);
>   	struct clk *clk;
> -	int ret;
> +	int ret, i;
> +
> +	econet_timer.is_percpu = of_device_is_compatible(np, "econet,en751221-timer");
> +
> +	if (econet_timer.is_percpu && num_irqs != 1) {
> +		pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
> +		       num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
> +		pr_err("%pOFn: Too many IRQs max %zd got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.irqs), num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
> +		pr_err("%pOFn: Too many regs: max %zd got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.membase), num_blocks);
> +		return -EINVAL;
> +	}
> +	if (num_blocks == 0) {
> +		pr_err("%pOFn: At least one reg block must be provided\n", np);
> +		return -EINVAL;
> +	}

The binding requires four interrupts and two register blocks for 
EN751627, but the driver sizes its resource arrays from NR_CPUS and 
rejects DTs exceeding those sizes. Consequently, a UP kernel (NR_CPUS=1) 
or an SMP kernel configured for two CPUs rejects a valid EN751627 DT 
before registering any timer.


>   	clk = of_clk_get(np, 0);
>   	if (IS_ERR(clk)) {
> @@ -164,7 +221,7 @@ static int __init timer_init(struct device_node *np)
>   	econet_timer.freq_hz = clk_get_rate(clk);
>   	clk_put(clk);
>   
> -	for (int i = 0; i < num_blocks; i++) {
> +	for (i = 0; i < num_blocks; i++) {
>   		econet_timer.membase[i] = of_iomap(np, i);
>   		if (!econet_timer.membase[i]) {
>   			pr_err("%pOFn: failed to map register [%d]\n", np, i);
> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node *np)
>   		}
>   	}
>   
> -	econet_timer.irq = irq_of_parse_and_map(np, 0);
> -	if (econet_timer.irq <= 0) {
> -		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
> -		ret = -EINVAL;
> -		goto out_membase;
> +	for (i = 0; i < num_irqs; i++) {
> +		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
> +		if (econet_timer.irqs[i] <= 0) {
> +			pr_err("%pOFn: failed mapping irq %d\n", np, i);
> +			ret = -EINVAL;
> +			goto out_irq_mapping;
> +		}
>   	}
>   
> -	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> -
> -	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
> -				 &econet_timer_pcpu);
> -
> -	if (ret < 0) {
> -		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
> -		       econet_timer.irq, ret);
> -		goto out_irq_mapping;
> +	for (i = 0; i < num_irqs; i++) {
> +		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
> +
> +		if (econet_timer.is_percpu)
> +			ret = request_percpu_irq(econet_timer.irqs[i],
> +						 cevt_interrupt, np->name,
> +						 &econet_timer_pcpu);
> +		else
> +			ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
> +					  IRQF_TIMER | IRQF_NOBALANCING,
> +					  np->name, NULL);
> +
> +		if (ret < 0) {
> +			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
> +			       i, ERR_PTR(ret));
> +			goto out_irq_free;
> +		}
>   	}
>   
>   	cevt_init(np);
> @@ -220,9 +287,17 @@ static int __init timer_init(struct device_node *np)
>   	return 0;
>   
>   out_irq_free:
> -	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
> +	while (--i >= 0) {
> +		if (econet_timer.is_percpu)
> +			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
> +		else
> +			free_irq(econet_timer.irqs[i], NULL);
> +	}
>   out_irq_mapping:
> -	irq_dispose_mapping(econet_timer.irq);
> +	for (i = 0; i < num_irqs; i++) {
> +		if (econet_timer.irqs[i] > 0)
> +			irq_dispose_mapping(econet_timer.irqs[i]);
> +	}
>   out_membase:
>   	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>   		if (econet_timer.membase[i]) {
> @@ -235,3 +310,4 @@ static int __init timer_init(struct device_node *np)
>   }
>   
>   TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
> +TIMER_OF_DECLARE(econet_timer_en751627, "econet,en751627-timer", timer_init);

