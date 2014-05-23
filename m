Received: from dns-bn1lp0143.outbound.protection.outlook.com ([207.46.163.143]:37302
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6830033AbaEWUcOh0X1V (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 23 May 2014 22:32:14 +0200
Date: Fri, 23 May 2014 22:31:18 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 10/15] MIPS: Add code for new system 'paravirt'.
Message-ID: <20140523203118.GM11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-11-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537CAC74.4030800@imgtec.com>
 <537CD4C6.5080905@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537CD4C6.5080905@caviumnetworks.com>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140523203118.VgyNJ_1DN5GNq1QgqqaTXLUQOuQhIc24IAagTqas7Sc@z>

On Wed, May 21, 2014 at 09:31:02AM -0700, David Daney wrote:
> On 05/21/2014 06:39 AM, James Hogan wrote:
> [...]
> >>diff --git a/arch/mips/paravirt/paravirt-irq.c b/arch/mips/paravirt/paravirt-irq.c
> >>new file mode 100644
> >>index 0000000..e1603dd
> >>--- /dev/null
> >>+++ b/arch/mips/paravirt/paravirt-irq.c
> [...]
> >
> >>+static void irq_core_set_enable_local(void *arg)
> >>+{
> >>+	struct irq_data *data = arg;
> >>+	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
> >>+	unsigned int mask = 0x100 << cd->bit;
> >>+
> >>+	/*
> >>+	 * Interrupts are already disabled, so these are atomic.
> >
> >Really? Even when called directly from irq_core_bus_sync_unlock with
> >only a single core online?
> >
> 
> Yes, but...
> 
> 
> >>+	 */
> >>+	if (cd->desired_en)
> >>+		set_c0_status(mask);
> >>+	else
> >>+		clear_c0_status(mask);
> >>+
> >>+}
> >>+
> >>+static void irq_core_disable(struct irq_data *data)
> >>+{
> >>+	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
> >>+	cd->desired_en = false;
> >>+}
> >>+
> >>+static void irq_core_enable(struct irq_data *data)
> >>+{
> >>+	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
> >>+	cd->desired_en = true;
> >>+}
> >>+
> >>+static void irq_core_bus_lock(struct irq_data *data)
> >>+{
> >>+	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
> >>+
> >>+	mutex_lock(&cd->core_irq_mutex);
> >>+}
> >>+
> >>+static void irq_core_bus_sync_unlock(struct irq_data *data)
> >>+{
> >>+	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
> >>+
> >>+	if (cd->desired_en != cd->current_en) {
> >>+		/*
> >>+		 * Can be called in early init when on_each_cpu() will
> >>+		 * unconditionally enable irqs, so handle the case
> >>+		 * where only a single CPU is online specially, and
> >>+		 * directly call.
> >>+		 */
> >>+		if (num_online_cpus() == 1)
> >>+			irq_core_set_enable_local(data);
> >>+		else
> >>+			on_each_cpu(irq_core_set_enable_local, data, 1);
> >>+
> 
> 
> ...  This code is not correct.  It was initially done as a
> workaround for the issues fixed in commit 202da4005.
> 
> Now that on_each_cpu() is less buggy, we can unconditionally use it
> and the assertion above about "Interrupts are already disabled" will
> be true.


I'll adapt this in the next version of the patch.


Andreas
