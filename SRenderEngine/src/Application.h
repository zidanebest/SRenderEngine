
namespace RE
{
    class Application
    {
    public:
        inline static Application& GetInstance(){return *m_Instance;}

        void Run();
        void OnEvent();
    protected:
        static Application* m_Instance;
    };
}
