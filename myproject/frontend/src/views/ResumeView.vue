<template>
  <div class="container-sm text-centered">
    <h2>My Resume</h2>
    <hr />
    <p>
      <a :href="pdfUrl" download>Download pdf</a> |
      <a :href="pdfUrl" target="_blank">Open in new tab</a>
    </p>
    <div class="iframe-container">
      <iframe :src="resumeUrl" frameborder="0"></iframe>
    </div>
  </div>
</template>

<script>
  export default {
    name: "ResumeView",
    data() {
      return {
        resumeUrl: "/web_resume.html",
        pdfUrl: "/web_resume_software_2025.pdf",
      }
    },
  }
</script>

<style scoped>
  .container-sm {
    padding-bottom: 60px;
  }

  .iframe-container {
  position: relative;
  width: 100%;
  padding-bottom: 75%;
  height: 0;
  overflow: hidden;
  max-width: 100%;
  background: #f4f4f4;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.iframe-container iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: 0;
}

@media (max-width: 768px) {
  .iframe-container {
    padding-bottom: 100%;
  }
}

@media (max-width: 480px) {
  .iframe-container {
    padding-bottom: 150%;
  }
}
</style>
