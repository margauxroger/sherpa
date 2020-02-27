import MarkdownIt from 'markdown-it';

const initMarkdown = () => {
  const textarea = document.getElementById('editor');
  const chapter_content = document.getElementById('chapter_content');
  const markdown = new MarkdownIt();
  if (textarea) {
  textarea.addEventListener('keyup', (event) => {
    const html = markdown.render(textarea.value);
    chapter_content.value = html;
  });
};
}

export { initMarkdown };
